//
//  RegisteredApplicationFactoryTest.m
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RegisteredApplicationFactory.h"

@interface RegisteredApplicationFactoryTest : XCTestCase

@end

@implementation RegisteredApplicationFactoryTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGetInstanceWithInvalidThrowsException {
    XCTAssertThrows([RegisteredApplicationFactory getApplicationList:-1]);
}

- (void)testGetInstanceWithValidInputGivesAValidObject {
    XCTAssertNotNil([RegisteredApplicationFactory getApplicationList:CoreDataType]);
}

-(void) testTryingToAddWithAWrongInputParamsThrowsException {
    XCTAssertThrows([RegisteredApplicationFactory createApplicationForType:-1 andApplicationName:@"App name" andUrl:@"Url"]);
}

-(void) testThatTryingToCreateAUrlWorksCorrectlyWithValidIshValues {
    NSString *url = @"Url";
    NSString *appName = @"Application name";
    
    RegisteredApplication * reg = [RegisteredApplicationFactory createApplicationDefaultType:appName andUrl:url];
    XCTAssertNotNil(reg);
    
    RegisteredApplicationList *list = [RegisteredApplicationFactory getDefaultApplicationList];
    XCTAssert([list count] > 0);
    XCTAssert([[[list objectAtIndex:0] applicationName] isEqualToString:@"Application name"]);

}

@end
