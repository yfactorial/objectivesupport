//
//  TestClassMiddle.m
//  objective_support
//
//  Created by vickeryj on 3/2/09.
//  Copyright 2009 Joshua Vickery. All rights reserved.
//

#import "TestClassMiddle.h"


@implementation TestClassMiddle

@synthesize testClasses;

- (void) dealloc
{
	[testClasses release];
	[super dealloc];
}


@end
