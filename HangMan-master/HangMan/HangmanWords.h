//
//  HangmanWords.h
//  HangMan
//
//  Created by Varun Santhanam on 2/24/13.
//  Copyright (c) 2013 Varun Santhanam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HangmanWords : NSObject {
    NSArray *words;
}

- (NSString *)getWord;

@end
