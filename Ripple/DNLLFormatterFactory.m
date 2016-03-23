//
//  DNLLFormatterFactory.m
//  Ripple
//
//  Created by Daniel Llewellyn on 17/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "DNLLFormatterFactory.h"
#import "DNLLRegisterUrl.h"
#import "DNLLCompleteUrl.h"
#import "DNLLUnRegisterUrl.h"

#ifndef RegisterURL
#define RegisterURL "ripple://com.ripple.register"
#define CompleteURL "ripple://com.ripple.complete"
#define UnregisterURL "ripple://com.ripple.unregister"
#endif

@implementation DNLLFormatterFactory

+(DNLLUrlFormatter * _Nullable) getFormatterFor:(NSURL * _Nonnull) url {
    
    DNLLUrlFormatter *formatter = nil;
    
    if ([[url absoluteString] containsString:@RegisterURL])
    {
        formatter = [[DNLLRegisterUrl alloc] initWithUrl:url];
    }
    else if ([[url absoluteString] containsString:@CompleteURL])
    {
        formatter = [[DNLLCompleteUrl alloc] initWithUrl:url];
    } else if ([[url absoluteString] containsString:@UnregisterURL])
    {
        formatter = [[DNLLUnRegisterUrl alloc] initWithUrl:url];
    }
    
    return formatter;
}
@end
