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
#import "Trigger.h"

@implementation URLSchemeHandler


-(UIAlertController*) retrieveResponseToAdding:(BOOL) wasSuccess
{
    NSString *message =  wasSuccess ?  @"The URL has been been added" : @"The url could not be added";
    UIAlertController* controller = [UIAlertController alertControllerWithTitle:@"URL received"
                                                                        message:message
                                                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
    [controller addAction:cancel];
    
    return controller;
}

-(UIAlertController*) retrieveResponseToCompletion
{
    NSString *message = @"Operation complete";
    UIAlertController* controller = [UIAlertController alertControllerWithTitle:@"Done"
                                                                        message:message
                                                                 preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil];
    [controller addAction:cancel];
    
    return controller;
}

-(UIAlertController* _Nullable) handleWithUrl:(NSURL* _Nonnull) url andApplicationName:(NSString * _Nonnull) applicationName
{
    
    UIAlertController * returnController = nil;
    
    if ([[url absoluteString] containsString:@RegisterURL])
    {
        
        // Register url
        RegisteredApplication *app = [RegisteredApplicationFactory createApplicationDefaultType:applicationName
                                                                                         andUrl:[NSString stringWithFormat:@"%@://%@",
                                                                                                 [url fragment],
                                                                                                 applicationName]];
        if (app != nil)
        {
            returnController = [self retrieveResponseToAdding:YES];
        }
        else
        {
            returnController = [self retrieveResponseToAdding:NO];
        }
        
    }
    else if ([[url absoluteString] isEqualToString:@CompleteURL])
    {
        [RegisteredApplicationFactory removeApplicationForNameAndDefaultType:applicationName];
       
        if (![Trigger trigger])
        {
            returnController = [self retrieveResponseToCompletion];
        }
    }
    else
    {
        [NSException exceptionWithName:@"Invalid url" reason:@"URL is not valid" userInfo:nil];
    }
    
    return returnController;
}

@end
