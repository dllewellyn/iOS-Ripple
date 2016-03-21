//
//  InternalResponders.h
//  Ripple
//
//  Created by Daniel Llewellyn on 21/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Responder.h"

@interface InternalResponders : NSObject


/**
 Init with responders
 
 @param responders list of type 'Responders'
 
 @returns InternalResponders instance
 */
-(instancetype _Nullable) initWithResponder:(NSArray<Responder*>*) responders;

// A list of internal responders
@property (readonly) NSArray<Responder*> *responders;

@end
