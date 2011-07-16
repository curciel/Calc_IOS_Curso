//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Curciel on 02/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CalculatorBrain : NSObject {
	double operand;
	NSString *waitingOperation;
	double waitingOperand;

}

- (void)setOperand: (double)anOperand;
- (double)performOperation:(NSString *)operation;

@end
