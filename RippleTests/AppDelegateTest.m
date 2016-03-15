//
//  AppDelegateTest.m
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppDelegate.h"

@interface AppDelegateTest : XCTestCase {
    AppDelegate *delegate;
}

@end

@implementation AppDelegateTest

- (void)setUp {
    [super setUp];
    delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
