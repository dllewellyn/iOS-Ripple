//
//  DNLLUnRegisterUrl.h
//  Ripple
//
//  Created by Daniel Llewellyn on 23/03/16.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "DNLLUrlFormatter.h"

/** Class to handle un-registering an application so that it no longer triggers */
@interface DNLLUnRegisterUrl : DNLLUrlFormatter

/**
 Init this class with a register URL
 
 @returns instance of Un-register url
 */
-(instancetype _Nullable) initWithScheme:(NSString * _Nonnull) scheme;

// Application scheme
@property NSString * _Nullable scheme;

@end
