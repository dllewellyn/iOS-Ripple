//
//  DNLLUnRegisterUrl.m
//  Ripple
//
//  Created by Daniel Llewellyn on 23/03/16.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "DNLLUnRegisterUrl.h"

@implementation DNLLUnRegisterUrl

// format of the application url
NSString *urlFormat = @"ripple://com.ripple.unregister#%@";

-(instancetype _Nullable) initWithScheme:(NSString * _Nonnull) scheme {
    self = [super init];
    
    if (self != nil)
    {
        self.urlType = UnregisterUrl;
        self.scheme = scheme;
        NSString *format = [NSString stringWithFormat:urlFormat, scheme];
        self.url = [NSURL URLWithString:format];
    }
    
    return self;
}

-(instancetype _Nullable) initWithUrl:(NSURL * _Nonnull) url {
    self = [super init];
    
    if (self != nil)
    {
        self.urlType = UnregisterUrl;
        self.scheme = [url fragment];
        self.url = url;
    }
    
    return self;
}
@end
