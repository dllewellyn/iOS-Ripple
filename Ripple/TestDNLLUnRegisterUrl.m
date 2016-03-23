//
//  TestDNLLUnRegisterUrl.m
//  Ripple
//
//  Created by Daniel Llewellyn on 23/03/16.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DNLLUnregisterUrl.h"

@interface TestDNLLUnRegisterUrl : XCTestCase

@end

@implementation TestDNLLUnRegisterUrl

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUnregisterConstructor {
    NSString *urlFormat = @"ripple://com.ripple.unregister#blah";
    NSString *scheme = @"blah";
    DNLLUnRegisterUrl *url = [[DNLLUnRegisterUrl alloc] initWithScheme:scheme];
    XCTAssert([[url.url absoluteString] isEqualToString:urlFormat]);
    XCTAssertEqual(url.urlType, UnregisterUrl);
}


- (void)testUnregisterConstructorWithUrl {
    NSString *urlFormat = @"ripple://com.ripple.unregister#blah";
    NSURL *murl = [NSURL URLWithString:urlFormat];

    DNLLUnRegisterUrl *url = [[DNLLUnRegisterUrl alloc] initWithUrl:murl];
    XCTAssert([[url.url absoluteString] isEqualToString:urlFormat]);
    XCTAssert([url.scheme isEqualToString:@"blah"]);
    XCTAssertEqual(url.urlType, UnregisterUrl);
}


@end
