//
//  Trigger.h
//  Ripple
//
//  Created by Daniel Llewellyn on 15/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Trigger : NSObject

/**
 Trigger the panic
 
 @param lastAppName the name of the last application that was triggered. Leave nil if you're
 just triggering
 
 @return whether or not there was any trigger
 */
+(BOOL) trigger:(NSString *) lastAppName;

@end
