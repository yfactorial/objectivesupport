//
//  TestClassTop.h
//  objective_support
//
//  Created by vickeryj on 3/2/09.
//  Copyright 2009 Joshua Vickery. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TestClassMiddle;

@interface TestClassTop : NSObject {

	TestClassMiddle *testClassMiddle;
	NSArray *testClasses;
	
}

@property(nonatomic, retain) TestClassMiddle *testClassMiddle;
@property(nonatomic, retain) NSArray *testClasses;


@end
