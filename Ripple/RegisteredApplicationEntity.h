//
//  RegisteredApplicationEntity.h
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#ifndef ENTITY_NAME
#define ENTITY_NAME "RegisteredApplicationEntity"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface RegisteredApplicationEntity : NSManagedObject
@end

NS_ASSUME_NONNULL_END

#import "RegisteredApplicationEntity+CoreDataProperties.h"
