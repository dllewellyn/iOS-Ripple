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

@interface RegisteredApplicationListCD()

@property NSMutableArray *internalHolder;

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
    
    
    if (error != nil) {
        #warning Handle this error
        NSLog(@"%@", error);
    }
    
    return self;
}

-(RegisteredApplication*) objectAtIndex:(NSUInteger) index {
    return [[self internalHolder] objectAtIndex:index];
}

-(NSUInteger) count {
    return [[self internalHolder] count];
}

@end
