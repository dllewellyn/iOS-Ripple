//
//  Trigger.m
//  Ripple
//
//  Created by Daniel Llewellyn on 15/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "Trigger.h"
#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "RegisteredApplicationFactory.h"

@implementation Trigger

+(void) trigger {
    
    RegisteredApplicationList* list = [RegisteredApplicationFactory getDefaultApplicationList];
    
    if ([list count] > 0)
    {
        NSURL *myURL = [NSURL URLWithString:[[list objectAtIndex:0] url]];
        NSLog(@"Triggering: %@", [myURL absoluteString]);
        [[UIApplication sharedApplication] openURL:myURL];
    }
}
@end
