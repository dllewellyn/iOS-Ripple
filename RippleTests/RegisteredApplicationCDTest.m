//
//  RegisteredApplicationCDTest.m
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RegisteredApplicationCD.h"
#import "CoreDataHandler.h"
#import "RegisteredApplicationEntity.h"


@interface RegisteredApplicationCDTest : XCTestCase

@end

@implementation RegisteredApplicationCDTest

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
    [super tearDown];
}

- (void)testInsertingAWorkout {
    NSString *url = @"com.example.url";
    NSString *appName = @"Application name";
    NSString *desc = @"appDesc";
    
    RegisteredApplication *racd = [[RegisteredApplicationCD alloc] initWithUrl:url andApplicationName:appName andAppDescription:desc];
    [racd save];

    NSPredicate *pred = [NSPredicate predicateWithFormat:@"applicationName == %@", appName];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@ENTITY_NAME];
    [request setPredicate:pred];
    NSError *error;
    
    CoreDataHandler *handler = [CoreDataHandler sharedInstance];
    NSArray *retArr = [handler.managedObjectContext executeFetchRequest:request error:&error];

    XCTAssertNil(error);
    XCTAssertNotNil(retArr);
    XCTAssert([retArr count] > 0);
    
    
    RegisteredApplication *obj = [retArr objectAtIndex:0];
    XCTAssert([obj.applicationName isEqualToString:appName]);
    XCTAssert([obj.url isEqualToString:url]);
    
}

-(void) testThatWhenWeChangeAnApplicationNameItUpdatesInTheDatabase {
    NSString *url = @"com.example.url";
    NSString *appName = @"Application name";
    NSString *appDesc = @"This+is+a+test+app+description";
    
    NSString *otherUrl = @"com.alternative.url";
    
    RegisteredApplication *racd = [[RegisteredApplicationCD alloc] initWithUrl:url andApplicationName:appName andAppDescription:appDesc];
    [racd save];
    
    racd.url = otherUrl;
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"applicationName == %@", appName];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@ENTITY_NAME];
    [request setPredicate:pred];
    NSError *error;
    
    CoreDataHandler *handler = [CoreDataHandler sharedInstance];
    NSArray *retArr = [handler.managedObjectContext executeFetchRequest:request error:&error];
    
    XCTAssertNil(error);
    XCTAssertNotNil(retArr);
    XCTAssert([retArr count] > 0);
    
    RegisteredApplication *obj = [retArr objectAtIndex:0];
    XCTAssert([obj.applicationName isEqualToString:appName]);
    XCTAssert([obj.url isEqualToString:otherUrl]);
}

-(void) testThatWecanDeleteAnObjectfromCd {
    NSString *appName = @"app name";
    NSString *appDesc = @"This+is+a+test+app+description";
    
    RegisteredApplication *racd = [[RegisteredApplicationCD alloc] initWithUrl:@"url"  andApplicationName:appName andAppDescription:appDesc];
    [racd save];
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"applicationName == %@", appName];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@ENTITY_NAME];
    [request setPredicate:pred];
    NSError *error;
    
    CoreDataHandler *handler = [CoreDataHandler sharedInstance];
    NSArray *retArr = [handler.managedObjectContext executeFetchRequest:request error:&error];
    
    XCTAssertNil(error);
    XCTAssertNotNil(retArr);
    XCTAssert([retArr count] > 0);
    
    [racd removeItem];
    
    retArr = [handler.managedObjectContext executeFetchRequest:request error:&error];
     XCTAssert([retArr count] == 0);
    
}

@end
