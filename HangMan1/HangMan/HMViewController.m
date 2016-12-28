//
//  HMViewController.m
//  HangMan
//
//  Created by Varun Santhanam on 2/24/13.
//  Copyright (c) 2013 Varun Santhanam. All rights reserved.
//

#import "HMViewController.h"

@interface HMViewController ()

@end

@implementation HMViewController

@synthesize wordBase;
@synthesize magicWord;
@synthesize feedbackString;
@synthesize guessedLettersArray;

@synthesize guessTextField;
@synthesize livesImageView;
@synthesize feedbackLabel;
@synthesize guessedLabel;
@synthesize endLabel;

#pragma mark - Instance Methods

- (void)initializeGame {
    /*
    HMLoadingViewController *loadingViewController = [[HMLoadingViewController alloc] initWithNibName:@"HMLoadingViewController" bundle:nil];
    [self presentViewController:loadingViewController animated:YES completion:nil];
     */
    magicWord = @"";
    while (magicWord.length == 0 || magicWord.length > 24) {
        magicWord = [wordBase getWord];
    }
    NSLog(@"%@", magicWord);
    [guessTextField setHidden: NO];
    [endLabel setHidden: YES];
    [guessTextField becomeFirstResponder];
    feedbackString = [self makeFeedbackStringFromOriginal:magicWord];
    [feedbackLabel setText:[self spaceString:feedbackString]];
    lives = 14;
    guessedLettersArray = [[NSMutableArray alloc] init];
    [guessedLabel setText:@""];
    [self updateLives];
}

- (void)makeGuess:(NSString *)guess {
    NSMutableArray *magicArray = [self makeMutableArrayFromString:magicWord];
    NSMutableArray *feedbackArray = [self makeMutableArrayFromString:feedbackString];
    [guessedLettersArray addObject:guess];
    if ([magicArray containsObject:guess]) {
        for (int i = 0; i < [magicArray count]; i++) {
            if ([[magicArray objectAtIndex:i] isEqual:guess]) {
                [feedbackArray replaceObjectAtIndex:i withObject:guess];
            }
        }
        feedbackString = [self makeStringFromMutableArray:feedbackArray];
        [feedbackLabel setText:[self spaceString:feedbackString]];
    } else {
        feedbackString = [self makeStringFromMutableArray:feedbackArray];
        [feedbackLabel setText:[self spaceString:feedbackString]];
        lives = lives - 1;
        [self updateLives];
    }

    [guessedLabel setText:[self spaceString:[self makeStringFromMutableArray:guessedLettersArray]]];
    if ([feedbackString isEqualToString:magicWord]) {
        [self victory];
    }
}

- (void)updateLives {
    int opposite = 14 - lives;
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"Hangman%d.gif", opposite]];
    [livesImageView setImage:image];
    
    if (lives == 0) {
        [guessTextField resignFirstResponder];
        [guessTextField setHidden: YES];
        [endLabel setHidden: NO];
        [endLabel setText:@":'("];
        [feedbackLabel setText:[self spaceString: magicWord]];
    }
}

- (void)victory {
    UIAlertView *victoriAlert = [[UIAlertView alloc]
                                 initWithTitle:@"You Win!"
                                 message:nil
                                 delegate:nil
                                 cancelButtonTitle:@"OK"
                                 otherButtonTitles:nil];
    [victoriAlert show];
    [guessTextField resignFirstResponder];
    [guessTextField setHidden: YES];
    [endLabel setHidden: NO];
    [endLabel setText:@";)"];
}

- (NSString *)makeFeedbackStringFromOriginal:(NSString *)original {
    NSString *returnString = @"";
    for (int i = 0; i < [original length]; i++) {
        NSString *currentItem = [NSString stringWithFormat:@"%C", [magicWord characterAtIndex:i]];
        if ([currentItem isEqual: @" "]) {
            returnString = [NSString stringWithFormat:@"%@ ", returnString];
        } else {
            returnString = [NSString stringWithFormat:@"%@_", returnString];
        }
    }
    
    NSLog(@"%@", [self spaceString: returnString]);
    return returnString;
}

- (NSString *)spaceString:(NSString *)string {
    NSString *returnString = [NSString stringWithFormat:@"%C", [string characterAtIndex:0]];
    for (int i = 1; i < [string length]; i++) {
        returnString = [NSString stringWithFormat:@"%@ %@", returnString, [NSString stringWithFormat:@"%C", [string characterAtIndex:i]]];
    }
    return returnString;
}

- (NSString *)makeStringFromMutableArray:(NSMutableArray *)array {
    NSString *returnString = @"";
    for (int i = 0; i < [array count]; i++) {
        returnString = [NSString stringWithFormat:@"%@%@", returnString, [array objectAtIndex:i]];
    }
    return returnString;
}

- (NSMutableArray *)makeMutableArrayFromString:(NSString *)string {
    NSMutableArray *returnArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < [string length]; i++) {
        [returnArray addObject:[NSString stringWithFormat:@"%C", [string characterAtIndex:i]]];
    }
    return returnArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    wordBase = [[HangmanWords alloc] init];
    [self initializeGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)evaluate:(id)sender {
    if (![guessedLettersArray containsObject:[guessTextField text]]) {
        [self makeGuess:[guessTextField text]];
    }
    [guessTextField setText:@""];
}

- (IBAction)newGame:(id)sender {
    [self initializeGame];
}

@end
