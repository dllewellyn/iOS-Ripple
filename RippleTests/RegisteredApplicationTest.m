//
//  RegisteredApplicationTest.m
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RegisteredApplication.h"
#import "RegisteredApplicationCD.h"
#import "RegisteredApplicationEntity.h"
#import "CoreDataHandler.h"

@interface RegisteredApplicationTest : XCTestCase

@end

@implementation RegisteredApplicationTest

- (void)setUp {
    [super setUp];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@ENTITY_NAME];
    NSError *error;
    
    CoreDataHandler *handler = [CoreDataHandler sharedInstance];
    NSArray *retArr = [handler.managedObjectContext executeFetchRequest:request error:&error];
    for (RegisteredApplicationEntity *obj in retArr) {
        [[obj managedObjectContext] deleteObject:obj];
    }
    
    XCTAssertNil(error);
    NSLog(@"%@", error);
    
    [handler.managedObjectContext save:&error];
    XCTAssertNil(error);
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRegisteredApplicationThrowsException {
    XCTAssertThrows([[RegisteredApplication alloc] initWithUrl:@"url" andApplicationName:@"test" andAppDescription:@"Test desc"]);
}

- (void)testRegisteredApplicationThrowsExceptionOnSave {
    RegisteredApplication *app = [[RegisteredApplication alloc] init];
    XCTAssertThrows([app save]);
}

@end
