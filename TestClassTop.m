//
//  TestClassTop.m
//  objective_support
//
//  Created by vickeryj on 3/2/09.
//  Copyright 2009 Joshua Vickery. All rights reserved.
//

#import "TestClassTop.h"
#import "TestClassMiddle.h"


@implementation TestClassTop

@synthesize testClassMiddle, testClasses;

- (void) dealloc
{
	[testClassMiddle release];
	[testClasses release];
	[super dealloc];
}


@end
