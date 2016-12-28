//
//  HMLoadingViewController.m
//  HangMan
//
//  Created by Varun Santhanam on 3/1/13.
//  Copyright (c) 2013 Varun Santhanam. All rights reserved.
//

#import "HMLoadingViewController.h"

@interface HMLoadingViewController ()

@end

@implementation HMLoadingViewController

@synthesize loadingView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadScreen:(int)snax {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadScreen: 14];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
