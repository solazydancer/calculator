//
//  CalculatorBrain.h
//  Calculator_HW
//
//  Created by Daria Skok on 05/06/2017.
//  Copyright © 2017 Daria Skok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

@property (nonatomic, strong) NSNumber *numberInMemory;
@property (nonatomic, strong) NSNumber *result;
@property (nonatomic, strong) NSString *operation;
@property (nonatomic, strong) NSNumber *operand;

- (NSNumber *) calculate;

@end
