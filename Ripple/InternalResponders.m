//
//  InternalResponders.m
//  Ripple
//
//  Created by Daniel Llewellyn on 21/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "InternalResponders.h"
@interface InternalResponders()

// Remove readonly
@property NSArray<Responder*> *responders;

@end

@implementation InternalResponders

-(instancetype _Nullable) initWithResponder:(NSArray<Responder*>*) responders {
    self = [self init];
    
    if (self != nil)
    {
        self.responders = responders;
    }
    
    return self;
}

@end
