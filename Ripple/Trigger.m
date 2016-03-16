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

+(BOOL) trigger {
    
    BOOL returnBool = NO;
    RegisteredApplicationList* list = [RegisteredApplicationFactory getDefaultApplicationList];
    
    if ([list count] > 0)
    {
        NSURL *myURL = [NSURL URLWithString:[[list objectAtIndex:0] url]];
        [[UIApplication sharedApplication] openURL:myURL];
        returnBool = YES;
    }
    
    return returnBool;
}
@end
