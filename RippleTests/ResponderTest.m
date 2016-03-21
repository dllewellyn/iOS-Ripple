//
//  ResponderTest.m
//  Ripple
//
//  Created by Daniel Llewellyn on 21/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Responder.h"

@interface ResponderTest : XCTestCase

@end

@implementation ResponderTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testResponderConstructor {
    NSString * testName = @"Test";
    NSString * testDescription = @"Test description";
    UIViewController *ctrl = [[UIViewController alloc] init];
    
    Responder *responder = [[Responder alloc] initWithName:testName andDescription:testDescription andViewController:ctrl];
    
    XCTAssert([responder.name isEqualToString:testName]);
    XCTAssert([responder.responderDescription isEqualToString:testDescription]);
    XCTAssert([responder.viewHandler isEqual:ctrl]);
}

@end
