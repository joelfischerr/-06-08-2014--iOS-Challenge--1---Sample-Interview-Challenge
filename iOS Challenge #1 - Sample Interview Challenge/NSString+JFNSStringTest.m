//
//  NSString+JFNSStringTest.m
//  iOS Challenge #1 - Sample Interview Challenge
//
//  Created by Joel Fischer on 07/08/14.
//  Copyright (c) 2014 Joel Fischer. All rights reserved.
//

#import "NSString+JFNSStringTest.h"

@implementation NSString (JFNSStringTest)

- (BOOL)isAlphaNumeric {

        BOOL isMatch = YES;

        for (int i = 0; i < [self length]; i++) {

                unichar c = [self characterAtIndex:i];

                if (!isalpha(c) && c != '_') {

                        isMatch = NO;
                        break;
                }
        }

        return isMatch;
}

- (BOOL)isAtLeastEightCharactersLong {

        if (self.length >= 8) {

                return YES;
        }

        return NO;
}

@end
