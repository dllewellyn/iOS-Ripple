//
//  ResponderUrlAdapter.h
//  Ripple
//
//  Created by Daniel Llewellyn on 22/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DNLLUrlFormatter.h"
#import "Responder.h"

@interface ResponderUrlAdapter : NSObject

/**
 Get a URL formatter for a given responder.
 
 @param responder the responder to get the formatter for

 @returns formatter object.
 */
+(DNLLUrlFormatter *) formatterForResponder:(Responder*) responder;
@end
