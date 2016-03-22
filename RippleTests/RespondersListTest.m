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

@property InternalResponders *responders;

@end

@implementation RespondersListTest

- (void)setUp {
    [super setUp];
    self.responders = [[InternalResponders alloc] initFromFile];
    [self.responders deleteSaved];
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

-(void) testSavingResponderList {
    self.responders = [[InternalResponders alloc] initFromFile];
    XCTAssertFalse([self.responders doesSaveDetailsExist]);
    XCTAssertTrue([self.responders saveToFile]);
    XCTAssertTrue([self.responders doesSaveDetailsExist]);
    
}


-(void) testSavingRespondersListAndChangingIt {
    NSString *name = @"Test name";
    
    Responder *resp = [self.responders.responders objectAtIndex:0];
    
    resp.name = name;
    resp.enabled = NO;
    resp.shareLocation = NO;
    
    XCTAssertTrue([self.responders saveToFile]);
    
    InternalResponders *responders = [[InternalResponders alloc] initFromFile];
    Responder *newResponder = [responders.responders objectAtIndex:0];
    XCTAssert([newResponder.name isEqualToString:name]);
    XCTAssertFalse(newResponder.enabled);
    XCTAssertFalse(newResponder.shareLocation);
    
}

@end
