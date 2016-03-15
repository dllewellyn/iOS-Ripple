//
//  CoreDataHandler.m
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "CoreDataHandler.h"

@implementation CoreDataHandler

static CoreDataHandler *instance;

+(instancetype) sharedInstance {
    if (instance == nil) {
        
        static dispatch_once_t pred;
        
        dispatch_once(&pred, ^ {
            instance = [[CoreDataHandler alloc] init];
            [instance initializeCoreData];
        });
    }
    
    return instance;
}


- (void)initializeCoreData
{
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Ripple" withExtension:@"momd"];
    NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    if (mom == nil) {
        [[NSException exceptionWithName:@"Core data error"
                                reason:@"Error initializing Managed Object Model"
                              userInfo:nil] raise];
    }
    
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    NSManagedObjectContext *moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [moc setPersistentStoreCoordinator:psc];
    
    [self setManagedObjectContext:moc];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSURL *documentsURL = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"Ripple"];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        
        NSError *error = nil;
        NSPersistentStoreCoordinator *psc = [self.managedObjectContext persistentStoreCoordinator];
        NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
        
        NSAssert(store != nil, @"Error initializing PSC: %@\n%@", [error localizedDescription], [error userInfo]);
    });
}

@end
