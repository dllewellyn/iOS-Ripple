//
//  SpecialResponders.h
//  Ripple
//
//  Created by Daniel Llewellyn on 23/03/16.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "Responder.h"

/**
 So what we would love to do is init a responder from a file (or anything else to be honest but we're not going to be able to do that without dynamic typing wizardry, so instead we'll initialise the list through this responder class. That means that when you call 'getResponder' and pass in the dictionary it will pick out the special classes (e.g. Twitter) and hand that back
 */
@interface SpecialResponders : Responder

/**
 Given the dict (from file) return the responder
 
 @param dict that has been taken either from the built in file, or from the
 
 @returns a responder object
 */
+(Responder* _Nullable) getResponder:(NSDictionary * _Nullable) dict;

@end
