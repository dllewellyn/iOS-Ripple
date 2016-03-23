//
//  ResponderUrlAdapter.h
//  Ripple
//
//  Created by Daniel Llewellyn on 22/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DNLLRegisterUrl.h"
#import "DNLLUnRegisterUrl.h"
#import "Responder.h"

@interface ResponderUrlAdapter : NSObject

/**
 Get a URL formatter for a given responder. This can be used to register
 the application
 
 @param responder the responder to get the formatter for

 @returns formatter object.
 */
+(DNLLRegisterUrl * _Nullable) registerUrlForResponder:(Responder* _Nonnull) responder;

/**
 Get a URL for a given responder that can be used to unregister the application
 
 @param responder to get formatter for 
 
 @returns formatter object
 */
+(DNLLUnRegisterUrl * _Nullable) unRegisterUrlForResponder:(Responder * _Nonnull) responder;

@end
