//
//  HMViewController.h
//  HangMan
//
//  Created by Varun Santhanam on 2/24/13.
//  Copyright (c) 2013 Varun Santhanam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HangmanWords.h"
#import "HMLoadingViewController.h"

@interface HMViewController : UIViewController {
    int lives;
}

@property (strong, nonatomic) HangmanWords *wordBase;
@property (strong, nonatomic) NSString *magicWord;
@property (strong, nonatomic) NSString *feedbackString;
@property (strong, nonatomic) NSMutableArray *guessedLettersArray;

@property (weak, nonatomic) IBOutlet UITextField *guessTextField;
@property (weak, nonatomic) IBOutlet UIImageView *livesImageView;
@property (weak, nonatomic) IBOutlet UILabel *feedbackLabel;
@property (weak, nonatomic) IBOutlet UILabel *guessedLabel;
@property (weak, nonatomic) IBOutlet UILabel *endLabel;

- (void)initializeGame;
- (void)makeGuess:(NSString *)guess;
- (void)updateLives;
- (void)victory;
- (NSString *)makeFeedbackStringFromOriginal:(NSString *)original;
- (NSString *)spaceString:(NSString *)string;
- (NSString *)makeStringFromMutableArray:(NSMutableArray *)array;
- (NSMutableArray *)makeMutableArrayFromString:(NSString *)string;

- (IBAction)evaluate:(id)sender;
- (IBAction)newGame:(id)sender;

@end
