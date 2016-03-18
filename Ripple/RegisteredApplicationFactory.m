//
//  RegisteredApplicationFactory.m
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "RegisteredApplicationFactory.h"
#import "RegisteredApplicationListCD.h"
#import "RegisteredApplicationCD.h"

// Use this class to get a copy of the the RegisteredApplication
@implementation RegisteredApplicationFactory

// Default type
const NSInteger defaultType = CoreDataType;

+(RegisteredApplicationList* _Nullable) getApplicationList:(NSInteger) type {
    
    RegisteredApplicationList *list = nil;
    
    switch (type) {
        case CoreDataType:
            list = [RegisteredApplicationListCD sharedInstance];
            break;
            
        default:
            [[NSException exceptionWithName:@"Invalid type" reason:@"An invalid type has been passed to getApplicationList" userInfo:nil] raise];
            break;
    }
    
    return list;
}

+(RegisteredApplicationList* _Nullable) getDefaultApplicationList {
    return [self getApplicationList:defaultType];
}

+(RegisteredApplication* _Nullable) createApplicationForType:(NSInteger) type andApplicationName:(NSString * _Nonnull) applicationName andUrlScheme:(NSString * _Nonnull) url
                                   andApplicationDescription:(NSString * _Nonnull)applicationDescription {
    RegisteredApplication *application = nil;
    
    switch (type) {
        case CoreDataType:
            application = [[RegisteredApplicationCD alloc] initWithUrlScheme:url andApplicationName:applicationName andAppDescription:applicationDescription];
            [[self getApplicationList:type] dataAdded:application];
            break;
        default:
            [[NSException exceptionWithName:@"Invalid type" reason:@"An invalid type has been passed into create application for type" userInfo:nil] raise];
            
    }
    
    return application;
}

+(RegisteredApplication* _Nullable) createApplicationDefaultType:(NSString * _Nonnull) applicationName andUrlScheme:(NSString * _Nonnull) url andApplicationDescription:(NSString * _Nonnull)applicationDescription {

    RegisteredApplication* app = [self createApplicationForType:defaultType andApplicationName:applicationName andUrlScheme:url andApplicationDescription:applicationDescription];
    [app save];
    return app;
}

+(void) removeApplicationForName:(NSString * _Nonnull) appName andType:(NSInteger) type {
    // Get the application that we've received completion for it and delete it
    
    RegisteredApplicationList *list = [self getApplicationList:type];
    for (int i = 0; i < [list count]; i++) {
        
        RegisteredApplication *app = [list objectAtIndex:i];
        
        if ([appName isEqualToString:app.applicationName])
        {
            [app removeItem];
            [app save];
            // Let the delegate know
            [list dataChangedAtIndex:i];
        }
    }
    
    [list reload];
}

+(void) removeApplicationForNameAndDefaultType:(NSString * _Nonnull)appName {
    [self removeApplicationForName:appName andType:defaultType];
}
@end
