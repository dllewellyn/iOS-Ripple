//
//  CoreDataHandler.h
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "RegisteredApplication.h"
#import <CoreData/CoreData.h>

@interface CoreDataHandler : NSObject

/** 
 Get the shared instance

 @instancetype instance of CoreDataHandler
 */
+(instancetype _Nonnull) sharedInstance;

/** Managed object context */
@property NSManagedObjectContext * _Nullable managedObjectContext;

@end
