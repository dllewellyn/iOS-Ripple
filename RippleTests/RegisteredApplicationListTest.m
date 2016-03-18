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

-(void) testThatIsObjectInListThrowsException {
    RegisteredApplicationList *list = [[RegisteredApplicationList alloc] init];
    XCTAssertThrows([list isObjectInList:@"Test"]);
}

-(void) testThatCounttThrowsException {
    RegisteredApplicationList *list = [[RegisteredApplicationList alloc] init];
    XCTAssertThrows([list count]);
}

-(void) testThatReloadThrowsException {
    RegisteredApplicationList *list = [[RegisteredApplicationList alloc] init];
    XCTAssertThrows([list reload]);
}
@end
