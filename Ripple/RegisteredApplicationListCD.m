//
//  RegisteredApplicationListCD.m
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "RegisteredApplicationListCD.h"
#import "RegisteredApplicationCD.h"
#import "RegisteredApplicationEntity.h"
#import "CoreDataHandler.h"

#import <Crashlytics/Crashlytics.h>

@interface RegisteredApplicationListCD()

// Internal holder for the application list
@property NSMutableArray<RegisteredApplication*> *internalHolder;

@end

@implementation RegisteredApplicationListCD


-(instancetype) initFromDataSource {
    self = [super init];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@ENTITY_NAME];
    NSError *error;
    
    CoreDataHandler *handler = [CoreDataHandler sharedInstance];
    
    NSArray<RegisteredApplicationEntity*> *entities = [handler.managedObjectContext executeFetchRequest:request error:&error];
    self.internalHolder = [[NSMutableArray alloc] init];
    
    for (RegisteredApplicationEntity *entity in entities)
    {
        RegisteredApplicationCD *app = [[RegisteredApplicationCD alloc] initWithUnderlyingObject:entity];
        [self.internalHolder addObject:app];
    }
    
    
    if (error != nil)
    {
        [[Crashlytics sharedInstance] recordError:error];
    }
    
    return self;
}

-(BOOL) isObjectInList:(NSString * _Nonnull) appName {
    BOOL isFound = NO;
    
    for (RegisteredApplication *app in self.internalHolder)
    {
        if ([app.applicationName isEqualToString:appName])
        {
            isFound = YES;
            break;
        }
    }
    
    return isFound;
}

-(RegisteredApplication*) objectAtIndex:(NSUInteger) index {
    return [[self internalHolder] objectAtIndex:index];
}

-(NSUInteger) count {
    return [[self internalHolder] count];
}

@end
