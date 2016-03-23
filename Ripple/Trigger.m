//
//  Trigger.m
//  Ripple
//
//  Created by Daniel Llewellyn on 15/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Twitter/Twitter.h>
#import <TwitterKit/TwitterKit.h>

#import "Trigger.h"
#import "AppDelegate.h"
#import "RegisteredApplicationFactory.h"
#import "DNLLTriggerUrl.h"

@implementation Trigger

+(BOOL) trigger:(NSString *) lastAppName andIsTest:(BOOL) isTest {
    
    BOOL returnBool = NO;
    RegisteredApplicationList* list = [RegisteredApplicationFactory getDefaultApplicationList];
    
   // [self shareTwitter];
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
            DNLLTriggerUrl *triggerUrl = [[DNLLTriggerUrl alloc] initWith:app.applicationName andTriggerType:app.urlScheme andIsTest:isTest];
            
            if (triggerUrl.url != nil)
            {
                returnBool = [[UIApplication sharedApplication] openURL:triggerUrl.url];
            }
        }
    }
    
    return returnBool;
}

+ (void) shareTwitter
{
    //Needs to performed once in order to get permissions from the user to post via your twitter app.
    [[Twitter sharedInstance]logInWithCompletion:^(TWTRSession *session, NSError *error) {
        //Session details can be obtained here
        //Get an instance of the TWTRAPIClient from the Twitter shared instance. (This is created using the credentials which was used to initialize twitter, the first time)
        TWTRAPIClient *client = [[TWTRAPIClient alloc] initWithUserID:session.userID];

        //Build the request that you want to launch using the API and the text to be tweeted.
        NSURLRequest *tweetRequest = [client URLRequestWithMethod:@"POST" URL:@"https://api.twitter.com/1.1/statuses/update.json" parameters:[NSDictionary dictionaryWithObjectsAndKeys:@"TEXT TO BE TWEETED", @"status", nil] error:&error];
        
        //Perform this whenever you need to perform the tweet (REST API call)
        [client sendTwitterRequest:tweetRequest completion:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            //Check for the response and update UI according if necessary.
        }];
    }];
}

@end
