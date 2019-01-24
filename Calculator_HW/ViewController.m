//
//  ViewController.m
//  Calculator_HW
//
//  Created by Daria Skok on 03/06/2017.
//  Copyright © 2017 Daria Skok. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *display;
@property (nonatomic, strong) CalculatorBrain *calculatorBrain;
@property (nonatomic, strong) NSNumberFormatter *numberFormatter;
@property (nonatomic, assign) BOOL userIsInTheMiddleOfTyping;

@end

@implementation ViewController


- (CalculatorBrain *)calculatorBrain {
    if(!_calculatorBrain) {
        _calculatorBrain = [[CalculatorBrain alloc] init];
    }
    return _calculatorBrain;
}

- (NSNumberFormatter *)numberFormatter {
    if (!_numberFormatter) {
        _numberFormatter = [[NSNumberFormatter alloc] init];
    }
    return _numberFormatter;
}


- (IBAction)enterDigits:(UIButton *)sender {
    NSString *displayedText = self.display.text;
    if (!self.userIsInTheMiddleOfTyping) {
        displayedText = @"";
        self.userIsInTheMiddleOfTyping = YES;
    }
    self.display.text = [NSString stringWithFormat:@"%@%@",displayedText,sender.titleLabel.text];
    
}

- (IBAction)clearAll:(UIButton *)sender {
    self.calculatorBrain = nil;
    self.display.text = @"0";
    self.userIsInTheMiddleOfTyping = NO;
}

- (IBAction)simpleOperation:(UIButton *)sender {
    self.calculatorBrain.operation = sender.titleLabel.text;
    self.userIsInTheMiddleOfTyping = NO;
    self.calculatorBrain.result = [self.numberFormatter numberFromString:self.display.text];
    self.display.text = [[self.calculatorBrain calculate] stringValue];
}

- (IBAction)removeLastDigit:(UIButton *)sender {
    self.calculatorBrain.operation = sender.titleLabel.text;
    self.calculatorBrain.result = [self.numberFormatter numberFromString:self.display.text];
    self.display.text = [[self.calculatorBrain calculate] stringValue];
}

- (IBAction)doOperation:(UIButton *)sender {
    self.userIsInTheMiddleOfTyping = NO;
    self.calculatorBrain.operand = [self.numberFormatter numberFromString: self.display.text];
    self.calculatorBrain.operation = sender.titleLabel.text;
}

- (IBAction)calculateResult:(UIButton *)sender {
    self.userIsInTheMiddleOfTyping = NO;
    self.calculatorBrain.result = [self.numberFormatter numberFromString: self.display.text];
    self.display.text = [[self.calculatorBrain calculate] stringValue];
    self.calculatorBrain.operation = nil;
}

@end
