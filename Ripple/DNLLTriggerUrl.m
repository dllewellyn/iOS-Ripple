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

// Trigger for a test
NSString *testTriggerFormat = @"%@://%@.test";

-(instancetype _Nullable) initWith:(NSString* _Nonnull) applicationName andTriggerType:(NSString* _Nonnull) triggerScheme andIsTest:(BOOL) isTest {
    
    self = [super init];
    
    if (self != nil)
    {
        NSString *fmtString = isTest ? testTriggerFormat : triggerFormat;
        
        NSString *urlString = [NSString stringWithFormat:fmtString,
                           triggerScheme, applicationName];
        self.url = [NSURL URLWithString:urlString];
        self.urlType = TriggerUrl;
    }
    
    return self;
}

-(instancetype _Nullable) initWithUrl:(NSURL *)url {
    self = [super init];
    
    if (self != nil)
    {
        self.url = url;
        
        self.applicationName = [self.url host];
        self.scheme = [self.url scheme];
        self.urlType = TriggerUrl;
    }
    return self;
}

@end
