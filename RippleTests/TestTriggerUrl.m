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
    
    NSURL *url = [[DNLLTriggerUrl alloc] initWith:appName andTriggerType:scheme andIsTest:NO].url;
    NSString *expected = [NSString stringWithFormat:@"%@://%@", scheme, appName];
    XCTAssert([[url absoluteString] isEqualToString:expected]);
}

- (void)testTriggerUrlConstructorThatsATest {
    NSString *scheme = @"scheme";
    NSString *appName = @"app.name.this";
    
    NSURL *url = [[DNLLTriggerUrl alloc] initWith:appName andTriggerType:scheme andIsTest:YES].url;
    NSString *expected = [NSString stringWithFormat:@"%@://%@.test", scheme, appName];
    XCTAssert([[url absoluteString] isEqualToString:expected]);
}

-(void) testTriggerUrlConstructorWithUrl {
    NSString * scheme = @"scheme";
    NSString * urlPath = @"com.test.blah";
    NSString *fmt = @"%@://%@";
    
    NSString *expected = [NSString stringWithFormat:fmt, scheme, urlPath];
    NSURL *url = [NSURL URLWithString:expected];
    DNLLTriggerUrl *trigger = [[DNLLTriggerUrl alloc] initWithUrl:url];
    XCTAssert([trigger.applicationName isEqualToString:urlPath]);
    XCTAssert([trigger.scheme isEqualToString:scheme]);
    
}

@end
