//
//  RegisteredApplicationCD.h
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "RegisteredApplication.h"
#import <CoreData/CoreData.h>
#import "RegisteredApplicationEntity.h"

@interface RegisteredApplicationCD : RegisteredApplication

/**
 Initialise the object with an Entity from Core data
 @param underlyingObject a RegisteredApplicationEntity object
 @return a RegisteredApplicationCD object
 */
-(instancetype _Nullable) initWithUnderlyingObject:(RegisteredApplicationEntity * _Nonnull) underlyingObject;

@end
