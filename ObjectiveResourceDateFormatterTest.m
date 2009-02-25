//
//  ObjectiveResourceDateFormatterTest.m
//  objective_support
//
//  Created by James Burka on 2/25/09.
//  Copyright 2009 Burkaprojects. All rights reserved.
//

#import "ObjectiveResourceDateFormatterTest.h"
#import "ObjectiveResourceDateFormatter.h"

@implementation ObjectiveResourceDateFormatterTest

-(void) testDefaultDate {
	
	[ObjectiveResourceDateFormatter setSerializeFormat:Date];
	NSDate* aDate = [ObjectiveResourceDateFormatter parseDate:@"2009-02-25"];
	STAssertEqualStrings([ObjectiveResourceDateFormatter formatDate:aDate],@"2009-02-25",@"Should match original");
}

-(void) testDefaultDateTime {
	[ObjectiveResourceDateFormatter setSerializeFormat:DateTime];	
	NSDate* aDate = [ObjectiveResourceDateFormatter parseDateTime:@"2009-02-25T12:00:00Z"];
	STAssertEqualStrings([ObjectiveResourceDateFormatter formatDate:aDate],@"2009-02-25T12:00:00Z",@"Should match original");
}

-(void) testTimeZoneSupport {
	[ObjectiveResourceDateFormatter setSerializeFormat:DateTime];	
	NSDate* aDate = [ObjectiveResourceDateFormatter parseDateTime:@"2009-02-25T23:45:00-5:00"];
	STAssertEqualStrings([ObjectiveResourceDateFormatter formatDate:aDate],@"2009-02-26T04:45:00Z",@"Should match original");	
}

@end
