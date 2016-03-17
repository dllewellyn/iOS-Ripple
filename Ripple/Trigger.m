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
#import "DNLLTriggerUrl.h"

@implementation Trigger

+(BOOL) trigger:(NSString *) lastAppName {
    
    BOOL returnBool = NO;
    RegisteredApplicationList* list = [RegisteredApplicationFactory getDefaultApplicationList];
    
    if ([list count] > 0)
    {
        int i;
        
        if (lastAppName == nil)
        {
            i = 0;
        }
        else
        {
            for (i = 0; i < [list count]; i++)
            {
                RegisteredApplication * app = [list objectAtIndex:i];
                if ([app.applicationName isEqualToString:lastAppName])
                {
                    i++;
                    break;
                }
            }
        }
        
        if (i < [list count])
        {

            RegisteredApplication *app = [list objectAtIndex:i];
            DNLLTriggerUrl *triggerUrl = [[DNLLTriggerUrl alloc] initWith:app.applicationName andTriggerType:app.urlScheme];
            
            if (triggerUrl.url != nil)
            {
                returnBool = [[UIApplication sharedApplication] openURL:triggerUrl.url];
            }
        }
    }
    
    return returnBool;
}
@end
