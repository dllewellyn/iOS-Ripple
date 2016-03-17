//
//  TestTriggerUrl.m
//  Ripple
//
//  Created by Daniel Llewellyn on 17/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DNLLTriggerUrl.h"

@interface TestTriggerUrl : XCTestCase

@end

@implementation TestTriggerUrl

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTriggerUrlConstructor {
    NSString *scheme = @"scheme";
    NSString *appName = @"app.name.this";
    
    NSURL *url = [[DNLLTriggerUrl alloc] initWith:appName andTriggerType:scheme].url;
    NSString *expected = [NSString stringWithFormat:@"%@://%@", scheme, appName];
    XCTAssert([[url absoluteString] isEqualToString:expected]);
}

@end
