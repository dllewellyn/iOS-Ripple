//
//  URLSchemeHandler.m
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "URLSchemeHandler.h"
#import "RegisteredApplication.h"
#import "RegisteredApplicationFactory.h"
#import <UIKit/UIKit.h>
#import "Trigger.h"

@implementation URLSchemeHandler

-(BOOL) handleWithUrl:(NSURL* _Nonnull) url andApplicationName:(NSString * _Nonnull) applicationName {
    BOOL success = NO;
    
    if ([[url absoluteString] containsString:@RegisterURL])
    {
        
        // Register url
        RegisteredApplication *app = [RegisteredApplicationFactory createApplicationDefaultType:applicationName
                                                                                         andUrl:[NSString stringWithFormat:@"%@://%@",
                                                                                                 [url fragment],
                                                                                                 applicationName]];
        if (app != nil) {
            success = YES;
        }
        
    }
    else if ([[url absoluteString] isEqualToString:@CompleteURL])
    {
        [RegisteredApplicationFactory removeApplicationForNameAndDefaultType:applicationName];
        [Trigger trigger];
    }
    else
    {
        [NSException exceptionWithName:@"Invalid url" reason:@"URL is not valid" userInfo:nil];
    }
    
    return success;
}

@end
