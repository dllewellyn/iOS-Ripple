//
//  ResponderUrlAdapter.m
//  Ripple
//
//  Created by Daniel Llewellyn on 22/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "ResponderUrlAdapter.h"

@implementation ResponderUrlAdapter

+(DNLLRegisterUrl * _Nullable) registerUrlForResponder:(Responder* _Nonnull) responder {
    DNLLRegisterUrl *registerUrl = [[DNLLRegisterUrl alloc] initWithDescription:responder.responderDescription andUrlScheme:responder.name];
    return registerUrl;
}

@end
