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
#import "ObjectiveResourceDateFormatter.h"

@implementation JSONDeserializeTest

-(void) testDeserializationOfNullDate {
	NSString *testJSON = @"{\"test_class\":{\"created_at\":null,\"name\":\"Hourly Test\"}}";
	TestClass *testClass = [TestClass fromJSONData:[testJSON dataUsingEncoding:NSUTF8StringEncoding]];
	STAssertTrue(testClass.createdAt == nil , @"should be nil");
	NSArray *toIgnore = [NSArray arrayWithObjects:@"testClassId",@"weight",nil];
	STAssertEqualStrings([testClass toJSONExcluding:toIgnore], testJSON, @"reserialization of object should match original string");
}

-(void) testDeserializationOfModel {
	[ObjectiveResourceDateFormatter setSerializeFormat:DateTime];
	NSString *testJSON = @"{\"test_class\":{\"created_at\":\"2009-02-16T10:43:50Z\",\"weight\":2.1,\"name\":\"Hourly Test\",\"id\":1}}";
	TestClass *testClass = [TestClass fromJSONData:[testJSON dataUsingEncoding:NSUTF8StringEncoding]];
	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setFormatterBehavior:NSDateFormatterBehavior10_4];
	[formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
	[formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
	NSDate* dateToTest =  [formatter dateFromString:@"2009-02-16T10:43:50Z"];	
	STAssertTrue([testClass.createdAt isEqualToDate:dateToTest], @"should be 2009-02-16T10:43:50Z");
	STAssertEqualStrings([testClass toJSONAs:@"test_class" excludingInArray:[NSArray array] 
													withTranslations:[NSDictionary dictionaryWithObject:@"id" forKey:@"testClassId"]], 
											 testJSON, @"reserialization of object should match original string");
}

-(void) testDeserializationOfArray {
	[ObjectiveResourceDateFormatter setSerializeFormat:DateTime];
	NSString *testJson = @"[{\"test_class\":{\"created_at\":\"2009-02-16T10:43:50Z\",\"name\":\"Hourly Test\",\"id\":1}},{\"test_class\":{\"created_at\":\"2009-02-16T10:43:50Z\",\"name\":\"Hourly Test\",\"id\":2}}]";
	NSArray *testClasses = [NSArray fromJSONData:[testJson dataUsingEncoding:NSUTF8StringEncoding]];
	STAssertTrue([testClasses count] == 2 , @"should be 2 items");
	STAssertTrue([((TestClass *)[testClasses objectAtIndex:0]).testClassId intValue]== 1,@"should be 1");
	STAssertEqualStrings([testClasses toJSONAs:@"test_class" excludingInArray:[NSArray arrayWithObject:@"weight"]
														withTranslations:[NSDictionary dictionaryWithObject:@"id" forKey:@"testClassId"]], testJson, @"reserialization of object should match original string");
	
	
}



@end
