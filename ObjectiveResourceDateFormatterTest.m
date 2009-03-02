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
	[ObjectiveResourceDateFormatter setDateFormatString:@"yyyy-MM-dd"];
	[ObjectiveResourceDateFormatter setSerializeFormat:Date];
	NSDate* aDate = [ObjectiveResourceDateFormatter parseDate:@"2009-02-25"];
	STAssertEqualStrings([ObjectiveResourceDateFormatter formatDate:aDate],@"2009-02-25",@"Should match original");
}

-(void) testDefaultDateTime {
	[ObjectiveResourceDateFormatter setDateTimeFormatString:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
	[ObjectiveResourceDateFormatter setSerializeFormat:DateTime];	
	NSDate* aDate = [ObjectiveResourceDateFormatter parseDateTime:@"2009-02-25T12:00:00Z"];
	STAssertEqualStrings([ObjectiveResourceDateFormatter formatDate:aDate],@"2009-02-25T12:00:00Z",@"Should match original");
}

-(void) testTimeZoneSupport {
	[ObjectiveResourceDateFormatter setDateTimeZoneFormatString:@"yyyy-MM-dd'T'HH:mm:ssz"];
	[ObjectiveResourceDateFormatter setSerializeFormat:DateTime];	
	NSDate* aDate = [ObjectiveResourceDateFormatter parseDateTime:@"2009-02-25T23:45:00-5:00"];
	STAssertEqualStrings([ObjectiveResourceDateFormatter formatDate:aDate],@"2009-02-26T04:45:00Z",@"Should match original in GMT");	
}

-(void) testCustomDateFormat {
	[ObjectiveResourceDateFormatter setSerializeFormat:Date];
	[ObjectiveResourceDateFormatter setDateFormatString:@"MM-dd-yyyy"];
	NSDate* aDate = [ObjectiveResourceDateFormatter parseDate:@"02-25-2009"];
	STAssertEqualStrings([ObjectiveResourceDateFormatter formatDate:aDate],@"02-25-2009",@"Should match original");
}

-(void) testCustomDateTimeFormat {
	[ObjectiveResourceDateFormatter setDateTimeFormatString:@"MM-dd-yyyy'T'HH:mm:ss'Z'"];
	[ObjectiveResourceDateFormatter setSerializeFormat:DateTime];	
	NSDate* aDate = [ObjectiveResourceDateFormatter parseDateTime:@"02-25-2009T23:45:00Z"];
	STAssertEqualStrings([ObjectiveResourceDateFormatter formatDate:aDate],@"02-25-2009T23:45:00Z",@"Should match original");	
}

-(void) testCustomDateTimeWithTimeZoneFormat {
	[ObjectiveResourceDateFormatter setSerializeFormat:DateTime];
	[ObjectiveResourceDateFormatter setDateTimeZoneFormatString:@"MM-dd-yyyy'T'HH:mm:ssz"];
	NSDate* aDate = [ObjectiveResourceDateFormatter parseDateTime:@"02-25-2009T23:45:00-5:00"];
	STAssertEqualStrings([ObjectiveResourceDateFormatter formatDate:aDate],@"2009-02-26T04:45:00Z",@"Should match default format in GMT");
}

- (void)tearDown {
	// reset defaults
	[ObjectiveResourceDateFormatter setDateFormatString:@"yyyy-MM-dd"];
	[ObjectiveResourceDateFormatter setDateTimeZoneFormatString:@"yyyy-MM-dd'T'HH:mm:ssz"];
	[ObjectiveResourceDateFormatter setDateTimeFormatString:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
	[ObjectiveResourceDateFormatter setSerializeFormat:DateTime];	
}

@end
