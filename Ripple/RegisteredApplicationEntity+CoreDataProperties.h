//
//  RegisteredApplicationEntity+CoreDataProperties.h
//  Ripple
//
//  Created by Daniel Llewellyn on 17/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "RegisteredApplicationEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface RegisteredApplicationEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *applicationName;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) NSString *applicationDescription;

@end

NS_ASSUME_NONNULL_END
