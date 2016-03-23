//
//  ResgisterUrl.m
//  Ripple
//
//  Created by Daniel Llewellyn on 17/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "DNLLRegisterUrl.h"

@implementation DNLLRegisterUrl

// Seperator
NSString *seperator = @"-";

// Format for a register URL
// <scheme>://<appname>#<returnscheme><seperator><description>
NSString *registerUrlFormat = @"ripple://com.ripple.register#%@%@%@";

-(instancetype _Nullable) initWithUrl:(NSURL * _Nonnull) url {
    self = [super init];
    
    if (self != nil)
    {
        self.urlType = RegisterUrl;
        
        if ([url fragment] != nil)
        {
            NSString * fragment = [url fragment];
            if ([fragment containsString:seperator])
            {
                NSArray *seperatedStrings = [fragment componentsSeparatedByString:seperator];
                if ([seperatedStrings count] > 1)
                {
                    self.responseName = [seperatedStrings objectAtIndex:0];
                    self.appDescription = [seperatedStrings objectAtIndex:1];
                    self.url = url;
                }
                else
                {
                    self = nil;
                }
                
            }
            else
            {
                self = nil;
            }
        }
        else
        {
            self = nil;
        }
    }
    
    return self;
}

-(instancetype _Nullable) initWithDescription:(NSString *) applicationDescription andUrlScheme:(NSString *) scheme {
    self = [super init];
    
    if (self != nil)
    {
        self.urlType = RegisterUrl;
        NSString *urlString = [NSString stringWithFormat:registerUrlFormat, [scheme urlEncode], seperator, [applicationDescription urlEncode]];
        self.url = [NSURL URLWithString:urlString];
        self.appDescription = applicationDescription;
        self.responseName = scheme;
    }
    return self;
}
@end
