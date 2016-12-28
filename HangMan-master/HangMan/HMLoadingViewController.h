//
//  HMLoadingViewController.h
//  HangMan
//
//  Created by Varun Santhanam on 3/1/13.
//  Copyright (c) 2013 Varun Santhanam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HMLoadingViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *loadingView;
- (void)loadScreen:(int)snax;
@end
