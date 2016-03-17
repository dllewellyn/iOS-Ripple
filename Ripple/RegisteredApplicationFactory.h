//
//  RegisteredApplicationFactory.h
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegisteredApplicationList.h"

typedef enum {
    CoreDataType = 1
} RegisteredApplicationTypes;

@interface RegisteredApplicationFactory : NSObject

/**
 Get a RegisteredApplicationList given the type
 
 @param type of type 'RegisteredApplicationTypes' (see above in .h)
 @returns an instance of a RegisteredApplicationList
 */
+(RegisteredApplicationList* _Nullable) getApplicationList:(NSInteger) type;

/**
 Get the efault application list
 @returns the default list
 */
+(RegisteredApplicationList* _Nullable) getDefaultApplicationList;

/**
 Get a registered application instance given:
 @param type the type (see RegisteredApplicationTypes)
 @param applicationName name of the application
 @param url url of the application
 @param applicationDescription description of the application
 */
+(RegisteredApplication* _Nullable) createApplicationForType:(NSInteger) type andApplicationName:(NSString * _Nonnull) applicationName andUrl:(NSString * _Nonnull) url
                                   andApplicationDescription:(NSString * _Nonnull) applicationDescription;

/**
 Get a registered application with the default type of application storage
 @param type the type (see RegisteredApplicationTypes)
 @param applicationName name of the application
 @param url url of the application
 */
+(RegisteredApplication* _Nullable) createApplicationDefaultType:(NSString * _Nonnull) applicationName andUrl:(NSString * _Nonnull) url
                                       andApplicationDescription:(NSString * _Nonnull) applicationDescription;

/**
 Given a particular application name, and the type of storage delete the application from the database
 @param appName name of the application
 @param type type of data storage
 */
+(void) removeApplicationForName:(NSString * _Nonnull) appName andType:(NSInteger) type;

/**
 Given a particular application name, delete from default data source
 @param appName application name to delete
 */
+(void) removeApplicationForNameAndDefaultType:(NSString * _Nonnull) appName;

@end
