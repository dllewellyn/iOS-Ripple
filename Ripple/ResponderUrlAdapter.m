//
//  ResponderUrlAdapter.m
//  Ripple
//
//  Created by Daniel Llewellyn on 22/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "ResponderUrlAdapter.h"
#import "InternalResponders.h"

#import <TwitterKit/TwitterKit.h>
#import <Twitter/Twitter.h>

@implementation ResponderUrlAdapter

+(DNLLRegisterUrl * _Nullable) registerUrlForResponder:(Responder* _Nonnull) responder {
    DNLLRegisterUrl *registerUrl = [[DNLLRegisterUrl alloc] initWithDescription:responder.responderDescription andUrlScheme:responder.name];
    return registerUrl;
}

+(DNLLUnRegisterUrl * _Nullable) unRegisterUrlForResponder:(Responder * _Nonnull) responder {
    DNLLUnRegisterUrl *unregisterUrl = [[DNLLUnRegisterUrl alloc] initWithScheme:responder.name];
    return unregisterUrl;
}

+(Responder * _Nullable) responderForUrl:(DNLLTriggerUrl* _Nonnull) trigger {
    InternalResponders *responders = [[InternalResponders alloc] initFromFile];

    Responder *returnResponer = nil;
    
    for (Responder *responder in responders.responders)
    {
        if ([responder.name isEqualToString:trigger.scheme])
        {
            returnResponer = responder;
            break;
        }
    }
    
    return returnResponer;
}

+(void) TwitterRipple {
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
