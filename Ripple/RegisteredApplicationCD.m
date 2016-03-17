//
//  RegisteredApplicationCD.m
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "RegisteredApplicationCD.h"
#import "CoreDataHandler.h"

@interface RegisteredApplicationCD() {
    RegisteredApplicationEntity *_underlyingObject;
}

@property (nonatomic, setter=setUrl:) NSString *url;
@property (nonatomic, setter=setAppName:) NSString *applicationName;
@property (nonatomic, setter=setApplicationDescription:) NSString *applicationDescription;

@end

@implementation RegisteredApplicationCD

@synthesize url = _url;
@synthesize applicationName = _applicationName;
@synthesize applicationDescription = _applicationDescription;

-(void) setAppName:(NSString * _Nonnull) applicationName {
    _underlyingObject.applicationName = applicationName;
    _applicationName = applicationName;
}


-(void) setUrl:(NSString * _Nonnull) url {
    _underlyingObject.url = url;
    _url = url;
}

-(void) setApplicationDescription:(NSString * _Nonnull) applicationDescription {
    _underlyingObject.applicationDescription = applicationDescription;
    _applicationDescription = applicationDescription;
}

-(instancetype _Nonnull) initWithUnderlyingObject:(RegisteredApplicationEntity * _Nonnull) underlyingObject {
    self = [super init];
    _underlyingObject = underlyingObject;
    _url = underlyingObject.url;
    _applicationName = underlyingObject.applicationName;
    _applicationDescription = underlyingObject.applicationDescription;
    
    return self;
}

-(instancetype _Nonnull) initWithUrl:(NSString* _Nonnull) url andApplicationName:(NSString* _Nonnull) applicationName andAppDescription:(NSString * _Nonnull) applicationDescription {
    self = [super init];
    
    if (self == nil) {
        [NSException exceptionWithName:@"Error initting" reason:@"Super class returned nil" userInfo:nil];
    }
    
    CoreDataHandler *handler = [CoreDataHandler sharedInstance];
    
    // Make sure this happens first since the setter for url and app name rely on _underlyingObject being set
    _underlyingObject = [NSEntityDescription insertNewObjectForEntityForName:@ENTITY_NAME
                                  inManagedObjectContext:handler.managedObjectContext];
    
    self.url = url;
    self.applicationName = applicationName;
    self.applicationDescription = applicationDescription;
    
    return self;
}
-(void) removeItem {
    [[_underlyingObject managedObjectContext] deleteObject:_underlyingObject];
    _url = nil;
    _applicationName = nil;
}

-(void) save {
    NSError *error;
    
    [[_underlyingObject  managedObjectContext] save:&error];
    
    if (error != nil) {
        #warning Handle this error
        NSLog(@"%@", error);
    }
}

@end
