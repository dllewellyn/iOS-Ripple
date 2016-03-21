//
//  ResponderFactory.h
//  Ripple
//
//  Created by Daniel Llewellyn on 21/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InternalResponders.h"

@interface ResponderFactory : NSObject

// Get shared instance
+(instancetype _Nullable) sharedInstance;

// Internal responders list
@property (readonly) InternalResponders *respondersList;

@end
