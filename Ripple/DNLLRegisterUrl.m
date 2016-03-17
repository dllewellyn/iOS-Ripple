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

@end
