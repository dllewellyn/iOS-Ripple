//
//  UrlSchemeHandlertest.m
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "URLSchemeHandler.h"
#import <CoreData/CoreData.h>
#import "RegisteredApplication.h"
#import "RegisteredApplicationCD.h"
#import "CoreDataHandler.h"

@interface UrlSchemeHandlertest : XCTestCase {
    URLSchemeHandler *handler;
}

@end

@implementation UrlSchemeHandlertest

- (void)setUp {
    [super setUp];
    handler = [[URLSchemeHandler alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUrlSchemeHandler {
    NSURL *url = [NSURL URLWithString:@RegisterURL];
    NSString *appName = @"Test app name";
    [handler handleWithUrl:url andApplicationName:appName];
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"applicationName == %@", appName];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@ENTITY_NAME];
    [request setPredicate:predicate];
    NSError *error;
    
    CoreDataHandler *cdHandler = [CoreDataHandler sharedInstance];
    NSArray *retArr = [cdHandler.managedObjectContext executeFetchRequest:request error:&error];

    XCTAssert([retArr count] > 0);

    RegisteredApplicationEntity *app = [retArr objectAtIndex:0];
    XCTAssert([app.applicationName isEqualToString:appName]);
    [[app managedObjectContext] deleteObject:app];
}

@end
