//
//  TestClass.m
//  objective_support
//
//  Created by vickeryj on 2/10/09.
//  Copyright 2009 Joshua Vickery. All rights reserved.
//

#import "TestClass.h"


@implementation TestClass

@synthesize name, createdAt , testClassId , weight;

#pragma mark cleanup
- (void) dealloc
{
	[weight release];
	[testClassId release];
	[name release];
	[createdAt release];
	[super dealloc];
}


@end
