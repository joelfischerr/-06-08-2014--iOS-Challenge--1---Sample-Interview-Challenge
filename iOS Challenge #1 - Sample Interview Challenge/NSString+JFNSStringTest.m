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

        NSCharacterSet *unwantedCharacters = [NSCharacterSet
                characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"];

        return !([self rangeOfCharacterFromSet:unwantedCharacters].location == NSNotFound) ? YES : NO;
}

- (BOOL)isAtLeastEightCharactersLong {

        if (self.length >= 8) {

                return YES;
        }

        return NO;
}

@end
