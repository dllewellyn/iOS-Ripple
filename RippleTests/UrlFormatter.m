//
//  UrlFormatter.m
//  Ripple
//
//  Created by Daniel Llewellyn on 17/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DNLLUrlFormatter.h"

@interface UrlFormatter : XCTestCase

@end

@implementation UrlFormatter

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testFormatter {
    XCTAssertThrows([[DNLLUrlFormatter alloc] initWithUrl:[NSURL URLWithString:@""]]);
}


@end
