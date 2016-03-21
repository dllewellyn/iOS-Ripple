//
//  RespondersListTest.m
//  Ripple
//
//  Created by Daniel Llewellyn on 21/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "InternalResponders.h"


@interface RespondersListTest : XCTestCase

@end

@implementation RespondersListTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testRespondersListConstructor {
    Responder *resp = [[Responder alloc] init];
    NSArray * arr = @[ resp ];
    InternalResponders *resps = [[InternalResponders alloc] initWithResponder:arr];
    XCTAssert([resps.responders count] > 0);
}
@end
