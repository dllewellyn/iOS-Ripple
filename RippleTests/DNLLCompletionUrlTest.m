//
//  DNLLCompletionUrlTest.m
//  Ripple
//
//  Created by Daniel Llewellyn on 17/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DNLLCompleteUrl.h"

@interface DNLLCompletionUrlTest : XCTestCase

@end

@implementation DNLLCompletionUrlTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testCompletionUrlConstructor {
    NSURL *url = [NSURL URLWithString:@"ripple://com.ripple.register"];
    XCTAssertNotNil([[DNLLCompleteUrl alloc] initWithUrl:url]);
}


@end
