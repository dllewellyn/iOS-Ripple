//
//  ResgisterUrl.h
//  Ripple
//
//  Created by Daniel Llewellyn on 17/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DNLLUrlFormatter.h"

@interface DNLLRegisterUrl : DNLLUrlFormatter

/**
 Init the class with values
 
 @param applicationDescription description of the application
 @param scheme scheme of the application
 
 @returns instance of DNLL register URL
 */
-(instancetype _Nullable) initWithDescription:(NSString * _Nonnull) applicationDescription
                                  andUrlScheme:(NSString * _Nonnull) scheme;

// Response trigger
@property NSString * _Nullable responseName;

// Description of the application that we are registering
@property NSString * _Nullable appDescription;

// Url 
@property NSURL * _Nullable url;

@end
