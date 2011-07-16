//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Curciel on 29/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"

@implementation CalculatorViewController

- (CalculatorBrain *)brain 
{
	if (!brain) {
		brain = [[CalculatorBrain alloc] init];
	}
	return brain;
}

				 
				 
				 

- (IBAction)digitPressed:(UIButton *)sender 
{
	NSString *digit = [[sender titleLabel] text];
	BOOL ocurrido = NO;
	NSString *aux;
	if (userIsInTheMiddleOfTypingANumber) {
		if ([@"." isEqual: digit]) {
			if (oneDotIsPut) {
				aux = display.text;
				display.text = @"Error, ya tiene un .";
				ocurrido = YES;
			}else {
				if (ocurrido) {
					display.text = aux;
					ocurrido = NO;
				}
				oneDotIsPut = YES;
				[display setText: [[display text] stringByAppendingString: digit]];
			}
		}else {
			if (ocurrido) {
				display.text = aux;
				ocurrido = NO;
			}
			[display setText: [[display text] stringByAppendingString: digit]];
		}
	} else {
		[display setText:digit];
		userIsInTheMiddleOfTypingANumber = YES;	
	}
}

- (IBAction)operationPressed:(UIButton *)sender 
{
	if (userIsInTheMiddleOfTypingANumber) {
		[[self brain] setOperand: [[display text] doubleValue]];
		userIsInTheMiddleOfTypingANumber = NO;
	}
	NSString *operation = [[sender titleLabel] text];
	double result = [[self brain] performOperation:operation];
	[display setText: [NSString stringWithFormat: @"%g", result]];
}

@end
