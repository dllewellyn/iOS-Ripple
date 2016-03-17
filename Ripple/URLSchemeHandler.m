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
#import "DNLLFormatterFactory.h"
#import "DNLLRegisterUrl.h"

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
    
    DNLLUrlFormatter *formatter = [DNLLFormatterFactory getFormatterFor:url];
    
    if (formatter == nil)
    {
       [NSException exceptionWithName:@"Invalid url" reason:@"URL is not valid" userInfo:nil];
    }
    
    switch (formatter.urlType)
    {
        case CompleteUrl:
            if (![Trigger trigger:applicationName])
            {
                returnController = [self retrieveResponseToCompletion];
            }
            break;
            
        case RegisterUrl:
        {
            DNLLRegisterUrl *regUrl =  (DNLLRegisterUrl *) formatter;
            
            // Register url
            RegisteredApplication *app = [RegisteredApplicationFactory createApplicationDefaultType:applicationName andUrlScheme:regUrl.responseName
                                                andApplicationDescription:regUrl.appDescription];
            if (app != nil)
            {
                returnController = [self retrieveResponseToAdding:YES];
            }
            else
            {
                returnController = [self retrieveResponseToAdding:NO];
            }
            
            break;
        }
           
        default:
            [NSException exceptionWithName:@"Invalid url" reason:@"URL is not valid" userInfo:nil];
            break;
    };
    
    return returnController;
}

@end
