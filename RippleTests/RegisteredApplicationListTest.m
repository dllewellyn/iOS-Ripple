//
//  RegisteredApplicationListTest.m
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RegisteredApplicationList.h"


@interface RegisteredApplicationListTest : XCTestCase

@end

@implementation RegisteredApplicationListTest

- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRegisteredAppListThrowsExceptionOnConstruct {
    XCTAssertThrows([[RegisteredApplicationList alloc] initFromDataSource]);
}


@end
