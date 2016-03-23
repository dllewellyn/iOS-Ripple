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
#import "DNLLRegisterUrl.h"
#import "RegisteredApplicationList.h"
#import "RegisteredApplicationFactory.h"
#import "DNLLUnRegisterUrl.h"

@interface UrlSchemeHandlertest : XCTestCase {
    URLSchemeHandler *handler;
}

@end

@implementation UrlSchemeHandlertest

- (void)setUp {
    [super setUp];
    handler = [[URLSchemeHandler alloc] init];
    RegisteredApplication * app = nil;
    
    RegisteredApplicationList * list = [RegisteredApplicationFactory getDefaultApplicationList];
    for (int i = 0 ; i < [list count]; i++)
    {
        app = [list objectAtIndex:i];
        [app removeItem];
    }
    
    if (app != nil) {
        [app save];
    }
}

- (void)tearDown {
    [super tearDown];
}

- (void) testUrlSchemeHandler {
    NSString *appName = @"Test app name";
    
    DNLLRegisterUrl *url = [[DNLLRegisterUrl alloc] initWithDescription:@"description" andUrlScheme:@"testscheme"];
    [handler handleWithUrl:url.url andApplicationName:appName];
    
    
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

-(void) testInvalidUrlScheme {
    NSURL *url = [NSURL URLWithString:@"ripple://com.ripple.invalid"];
    XCTAssertThrows([handler handleWithUrl:url andApplicationName:@"Testname"]);
}

-(void) testThatRegisteringAndThenUnregisteringAUrlMeansItIsRemoved {
    NSString *appName = @"Test app name";
    
    RegisteredApplicationList * list = [RegisteredApplicationFactory getDefaultApplicationList];
    [list reload];
    XCTAssertEqual([list count], 0);
    
    DNLLRegisterUrl *url = [[DNLLRegisterUrl alloc] initWithDescription:@"description" andUrlScheme:@"testscheme"];
    [handler handleWithUrl:url.url andApplicationName:appName];
    

    [list reload];
    XCTAssert([[list objectAtIndex:0].applicationName isEqualToString:appName]);
    
    DNLLUnRegisterUrl *unreg = [[DNLLUnRegisterUrl alloc] initWithScheme:@"testscheme"];
    [handler handleWithUrl:unreg.url andApplicationName:appName];
    
    [list reload];
    XCTAssertEqual([list count], 0);
    
}

@end
