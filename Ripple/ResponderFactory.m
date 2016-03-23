//
//  ResponderFactory.m
//  Ripple
//
//  Created by Daniel Llewellyn on 21/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "ResponderFactory.h"

@interface ResponderFactory()
// Remove readonly
@property InternalResponders *respondersList;

@end

@implementation ResponderFactory

static ResponderFactory *instance;

+(instancetype _Nullable) sharedInstance {
    if (instance == nil) {
        instance = [[ResponderFactory alloc] init];
        instance.respondersList = [[InternalResponders alloc] initFromFile];
    }
    
    return instance;
}

@end
