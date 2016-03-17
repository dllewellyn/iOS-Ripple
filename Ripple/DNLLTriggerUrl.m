//
//  DNLLTriggerUrl.m
//  Ripple
//
//  Created by Daniel Llewellyn on 17/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "DNLLTriggerUrl.h"

@implementation DNLLTriggerUrl

// Format for the trigger is scheme://appName
NSString *triggerFormat = @"%@://%@";

-(instancetype _Nullable) initWith:(NSString* _Nonnull) applicationName andTriggerType:(NSString* _Nonnull) triggerScheme {
    
    self = [super init];
    
    if (self != nil)
    {
        NSString *urlString = [NSString stringWithFormat:triggerFormat,
                           triggerScheme, applicationName];
        self.url = [NSURL URLWithString:urlString];
        self.urlType = TriggerUrl;
    }
    
    return self;
}
@end
