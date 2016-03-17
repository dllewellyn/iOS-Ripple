//
//  RegisteredApplication.h
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <Foundation/Foundation.h>

// In order to decouple this object
// from storage, create this protocol so that
// any registered applications can be accessed from an
@interface RegisteredApplication : NSObject


/**
 Construct an application with a url and app name
 
 @param url the URL that we can open in order to trigger panic for a given app
 @param applicationName name of the application
 */
-(instancetype _Nonnull) initWithUrl:(NSString* _Nonnull) url andApplicationName:(NSString* _Nonnull) applicationName andAppDescription:(NSString * _Nonnull) applicationDescription;

/**
 Save this object to whatever subclassed storage handler
 */
-(void) save;

/**
 Delete this object
 */
-(void) removeItem;

// Url
@property NSString * _Nullable url;

// Application name
@property NSString * _Nullable applicationName;

// Description of the application
@property NSString * _Nullable applicationDescription;

@end
