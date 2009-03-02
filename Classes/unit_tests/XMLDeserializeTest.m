//
//  XMLDeserializeTest.m
//  objective_support
//
//  Created by James Burka on 2/13/09.
//  Copyright 2009 Burkaprojects. All rights reserved.
//

#import "XMLDeserializeTest.h"
#import "NSObject+XMLSerializableSupport.h"
#import "TestClass.h"
#import "ObjectiveResourceDateFormatter.h"
#import "TestClassMiddle.h"
#import "TestClassTop.h"

@implementation XMLDeserializeTest

-(void) testDeserializationOfNullDate {
	NSString *testXML = @"<test-class><created-at type=\"datetime\"></created-at><name>Hourly Test</name></test-class>";
	TestClass *testClass = [TestClass fromXMLData:[testXML dataUsingEncoding:NSUTF8StringEncoding]];
	STAssertTrue(testClass.createdAt == nil , @"should be nil");
	NSArray *toIngore = [NSArray arrayWithObjects:@"testClassId",@"weight",nil];
	STAssertEqualStrings([testClass toXMLElementExcluding:toIngore], @"<test-class><created-at></created-at><name>Hourly Test</name></test-class>", @"reserialization of object should match expected string");
}

-(void) testDeserializationOfModel {
	[ObjectiveResourceDateFormatter setSerializeFormat:DateTime];
	NSString *testXML = @"<test-class><created-at type=\"datetime\">2009-02-16T10:43:50Z</created-at><weight type=\"decimal\">2.1</weight><name>Hourly Test</name><id type=\"integer\">1</id></test-class>";
	TestClass *testClass = [TestClass fromXMLData:[testXML dataUsingEncoding:NSUTF8StringEncoding]];
	NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setFormatterBehavior:NSDateFormatterBehavior10_4];
	[formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
	[formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
	NSDate* dateToTest =  [formatter dateFromString:@"2009-02-16T10:43:50Z"];
	STAssertTrue([testClass.name isEqualToString:@"Hourly Test"] , @"should be \"Hourly Test\"");
	STAssertTrue([testClass.createdAt isEqualToDate:dateToTest] , @"Date should be 2009-02-16T10:43:50Z , but got %@" , testClass.createdAt);
	STAssertTrue([testClass.testClassId intValue] == 1,@"Model should have an id of 1");
	
	NSString *output = @"<test-class><created-at type=\"datetime\">2009-02-16T10:43:50Z</created-at><weight>2.1</weight><name>Hourly Test</name><id>1</id></test-class>";
	STAssertEqualStrings([testClass toXMLElementAs:@"test-class" excludingInArray:[NSArray array] 
											 withTranslations:[NSDictionary dictionaryWithObject:@"id" forKey:@"testClassId"]], 
											 output, @"reserialization of object should match original string");
}

-(void) testDeserializationOfArray {
	[ObjectiveResourceDateFormatter setSerializeFormat:DateTime];
	NSString *testXML = @"<test-classes type=\"array\"><test-class><created-at></created-at><name>Hourly Test</name></test-class><test-class><created-at type=\"datetime\">2009-02-16T10:43:50Z</created-at><name>Hourly Test</name></test-class></test-classes>";
	NSArray *testClasses = [NSArray fromXMLData:[testXML dataUsingEncoding:NSUTF8StringEncoding]];
	NSArray *toIngore = [NSArray arrayWithObjects:@"testClassId",@"weight",nil];
	STAssertTrue([testClasses count] == 2 , @"should be 2 items");
	STAssertEqualStrings([testClasses toXMLElementAs:@"test-classes" 
																	excludingInArray:toIngore], 
											 testXML, @"reserialization of object should match original string");
	
	
}

-(void) testArrayProperties {
	[ObjectiveResourceDateFormatter setSerializeFormat:DateTime];
	NSString *testXML = @"<test-class-top><test-class-middle><test-classes type=\"array\"><test-class><created-at></created-at><name>Hourly Test</name></test-class><test-class><created-at type=\"datetime\">2009-02-16T10:43:50Z</created-at><name>Hourly Test</name></test-class></test-classes></test-class-middle><test-classes type=\"array\"><test-class><created-at></created-at><name>Hourly Test</name></test-class><test-class><created-at type=\"datetime\">2009-02-16T10:43:50Z</created-at><name>Hourly Test</name></test-class></test-classes><test-class-top>";
	TestClassTop *testclassTop = [TestClassTop fromXMLData:[testXML dataUsingEncoding:NSUTF8StringEncoding]];
	STAssertEquals([testclassTop.testClasses count], [testclassTop.testClassMiddle.testClasses count], @"both test classes should have the same number of entries in their array properties");
	
}

@end
