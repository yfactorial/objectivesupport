//
//  objective_supportAppDelegate.m
//  objective_support
//
//  Created by vickeryj on 1/26/09.
//  Copyright Joshua Vickery 2009. All rights reserved.
//

#import "objective_supportAppDelegate.h"

@implementation objective_supportAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
