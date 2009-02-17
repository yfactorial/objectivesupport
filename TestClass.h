//
//  TestClass.h
//  objective_support
//
//  Created by vickeryj on 2/10/09.
//  Copyright 2009 Joshua Vickery. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TestClass : NSObject {

	NSString *name;
	NSDate *createdAt;
	NSNumber *testClassId;
	NSDecimalNumber *weight;
	
}

@property(nonatomic, retain) NSDecimalNumber *weight;
@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSDate *createdAt;
@property(nonatomic, retain) NSNumber *testClassId;

@end
