//
//  CalculatorBrain.m
//  Calculator_HW
//
//  Created by Daria Skok on 05/06/2017.
//  Copyright © 2017 Daria Skok. All rights reserved.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain

- (NSNumber *) calculate {
    if ([self.operation isEqualToString:@"⁒"]) {
        self.result = [NSNumber numberWithDouble:([self.operand doubleValue] / [self.result doubleValue])];
    }
    if ([self.operation isEqualToString:@"✕"]) {
        self.result = [NSNumber numberWithDouble:([self.operand doubleValue] * [self.result doubleValue])];
        
    }
    if ([self.operation isEqualToString:@"-"]) {
        self.result = [NSNumber numberWithDouble:([self.operand doubleValue] - [self.result doubleValue])];
        
    }
    if ([self.operation isEqualToString:@"+"]) {
        self.result = [NSNumber numberWithDouble:([self.operand doubleValue] + [self.result doubleValue])];
        
    }
    if ([self.operation isEqualToString:@"↩︎"]) {
        self.result = [NSNumber numberWithDouble:[[[self.result stringValue] substringToIndex:([[self.result stringValue] length]-1)] doubleValue]];
        
    }
    if ([self.operation isEqualToString:@"√"]) {
        self.result = [NSNumber numberWithDouble:sqrt([self.result doubleValue])];
        
    }
    if ([self.operation isEqualToString:@"+/-"]) {
        self.result = [NSNumber numberWithDouble:([self.result doubleValue] * -1)];
        
    }
    if ([self.operation isEqualToString:@"mc"]) {
        self.numberInMemory = self.result;
    }
    if ([self.operation isEqualToString:@"m+"]) {
        self.result = [NSNumber numberWithDouble:([self.numberInMemory doubleValue] + [self.result doubleValue])];
        
    }
    if ([self.operation isEqualToString:@"m-"]) {
        self.result = [NSNumber numberWithDouble:([self.result doubleValue] - [self.numberInMemory doubleValue])];
        
    }
    if ([self.operation isEqualToString:@"mr"]) {
        self.result = self.numberInMemory;
    }
    return self.result;
}

@end
