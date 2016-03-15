//
//  RegisteredApplicationListCDTest.m
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RegisteredApplicationListCD.h"
#import "RegisteredApplicationCD.h"
#import "RegisteredApplicationEntity.h"
#import "CoreDataHandler.h"

@interface RegisteredApplicationListCDTest : XCTestCase

@end

@implementation RegisteredApplicationListCDTest

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

- (void)testThatTheListGetsAllRegisteredApplications {
    
    
    NSString *url = @"com.example.url";
    NSString *appName = @"Application name";
    
    NSString *url2 = @"com.example.url2";
    NSString *appName2 = @"Application name2";
    
    RegisteredApplication *racd = [[RegisteredApplicationCD alloc] initWithUrl:url andApplicationName:appName];
    [racd save];
    
    RegisteredApplication *racd1 = [[RegisteredApplicationCD alloc] initWithUrl:url2 andApplicationName:appName2];
    [racd1 save];
    
    RegisteredApplicationListCD *list = [[RegisteredApplicationListCD alloc] initFromDataSource];
    XCTAssertNotNil(list);
    XCTAssert([list count] > 0);
    
    RegisteredApplication *cd1 = [list objectAtIndex:0];
    RegisteredApplication *cd2 = [list objectAtIndex:1];
    
    XCTAssert([cd1.applicationName isEqualToString:appName]);
    XCTAssert([cd2.applicationName isEqualToString:appName2]);
    
    XCTAssert([cd1.url isEqualToString:url]);
    XCTAssert([cd2.url isEqualToString:url2]);
}

@end
