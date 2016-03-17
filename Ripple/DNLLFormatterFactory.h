//
//  DNLLFormatterFactory.h
//  Ripple
//
//  Created by Daniel Llewellyn on 17/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DNLLUrlFormatter.h"

@interface DNLLFormatterFactory : NSObject

/**
 Get the formatter for a given url
 @param url
 @return 
 */
+(DNLLUrlFormatter *) getFormatterFor:(NSURL * _Nonnull) url;

@end