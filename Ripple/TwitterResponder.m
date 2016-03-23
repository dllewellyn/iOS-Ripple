//
//  TwitterResponder.m
//  Ripple
//
//  Created by Daniel Llewellyn on 23/03/16.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "TwitterResponder.h"
#import <Twitter/Twitter.h>
#import <TwitterKit/TwitterKit.h>
#import <Crashlytics/Crashlytics.h>

@implementation TwitterResponder

const NSString *userId = @"user_id";

-(instancetype _Nullable) initWithDicitonary:(NSDictionary *)dictionary {
    self = [super initWithDicitonary:dictionary];

    if (self != nil)
    {
        self.userId = dictionary[userId];
    }
    
    return self;
}

-(NSDictionary *) getDictionaryForResponder {
    NSMutableDictionary *dict = [[super getDictionaryForResponder] mutableCopy];
    dict[userId] = self.userId;
    return dict;
}

-(void) triggerAction {
    TWTRAPIClient *client = [[TWTRAPIClient alloc] initWithUserID:self.userId];
    NSError *error;
    
    //Build the request that you want to launch using the API and the text to be tweeted.
    NSURLRequest *tweetRequest = [client URLRequestWithMethod:@"POST" URL:@"https://api.twitter.com/1.1/statuses/update.json" parameters:[NSDictionary dictionaryWithObjectsAndKeys:@"TEXT TO BE TWEETED", @"status", nil] error:&error];
    
    if (error != nil) {
        [[Crashlytics sharedInstance] recordError:error];
    }
    //Perform this whenever you need to perform the tweet (REST API call)
    [client sendTwitterRequest:tweetRequest completion:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (error != nil) {
            [[Crashlytics sharedInstance] recordError:error];
        }
    
    }];
}

-(void) saveAction {
    //Needs to performed once in order to get permissions from the user to post via your twitter app.
    [[Twitter sharedInstance]logInWithCompletion:^(TWTRSession *session, NSError *error) {
        self.userId = session.userID;
    }];
}

@end
