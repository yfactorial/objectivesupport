//
//  JSONDeserializeTest.m
//  objective_support
//
//  Created by vickeryj on 2/10/09.
//  Copyright 2009 Joshua Vickery. All rights reserved.
//

#import "JSONDeserializeTest.h"
#import "NSObject+JSONSerializableSupport.h"
#import "TestClass.h"

@implementation JSONDeserializeTest

-(void) testDeserializationOfNullDate {
	NSString *testJSON = @"{\"test_class\":{\"name\":\"Hourly Test\",\"created_at\":null}}";
	TestClass *testClass = (TestClass *)[NSObject fromJSONData:[testJSON dataUsingEncoding:NSUTF8StringEncoding]];
	STAssertTrue(testClass.createdAt == nil , @"should be nil");
	STAssertEqualStrings([testClass toJSON], testJSON, @"reserialization of object should match original string");
}

@end
