//
//  NSDateTest.m
//  objective_support
//
//  Created by James Burka on 2/10/09.
//  Copyright 2009 Burkaprojects. All rights reserved.
//

#import "NSDateTest.h"
#import "NSDate+Serialize.h"


@implementation NSDateTest

-(void) testDeserializationOfNull {
	STAssertTrue([NSDate deserialize:[NSNull null]] == nil , @"should be nil");
}


@end
