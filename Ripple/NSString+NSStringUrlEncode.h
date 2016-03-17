//
//  NSStringUrlEncode.h
//  Ripple
//
//  Created by Daniel Llewellyn on 17/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSStringUrlEncode)

/**
 URL Encode
 
 @return url encode 
 */
-(NSString *) urlEncode;

@end
