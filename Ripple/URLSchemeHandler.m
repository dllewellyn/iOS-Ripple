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
#import "DNLLUnRegisterUrl.h"

@implementation URLSchemeHandler

// Complete
NSString *OpComplete = @"Operation complete";

// Already stored
NSString *AlreadyStored = @"Application already stored in the list";

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

-(UIAlertController*) retrieveResponseToCompletion:(NSString* ) message
{
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
        [[NSException exceptionWithName:@"Invalid url" reason:@"URL is not valid" userInfo:nil] raise];
    }
    
    switch (formatter.urlType)
    {
        case CompleteUrl:
            if (![Trigger trigger:applicationName andIsTest:NO])
            {
                returnController = [self retrieveResponseToCompletion:OpComplete];
            }
            break;
            
        case RegisterUrl:
        {
            
            RegisteredApplicationList *list = [RegisteredApplicationFactory getDefaultApplicationList];
            if (![list isObjectInList:applicationName])
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
            }
            else
            {
                returnController = [self retrieveResponseToCompletion:AlreadyStored];
            }
            
            break;
        }
        case UnregisterUrl:
        {
            RegisteredApplicationList * list = [RegisteredApplicationFactory getDefaultApplicationList];
            DNLLUnRegisterUrl *unregFormatter = (DNLLUnRegisterUrl*) formatter;
            
            for (int i = 0; i < [list count]; i++)
            {
                
                RegisteredApplication * app = [list objectAtIndex:i];
                
                if ([app.applicationName isEqualToString:applicationName] && [app.urlScheme isEqualToString:unregFormatter.scheme])
                {
                    [app removeItem];
                    [app save];
                    [list dataChangedAtIndex:i];
                    break;
                }
                
            }
            break;
        }
        default:
            break;
    };
    
    return returnController;
}

@end
