 //
//  HangmanWords.m
//  HangMan
//
//  Created by Varun Santhanam on 2/24/13.
//  Copyright (c) 2013 Varun Santhanam. All rights reserved.
//

#import "HangmanWords.h"

@implementation HangmanWords

- (id)init {
    if ((self = [super init])) {
        words = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"words" ofType:@"plist"]];
        
        srand(time(NULL));
    }
    
    return self;
}

- (NSString *) getWord {
	int index = rand() % [words count];
	return [words objectAtIndex: index];
}

@end
