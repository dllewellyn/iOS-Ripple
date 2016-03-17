//
//  RegisteredApplication.m
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "RegisteredApplication.h"

@implementation RegisteredApplication

-(instancetype) initWithUrl:(NSString*) url andApplicationName:(NSString*) applicationName andAppDescription:(NSString * _Nonnull)applicationDescription {
    [[NSException exceptionWithName:@"Needs subclassing" reason:@"This class needs to be subclassed before use" userInfo:nil] raise];
    return nil;
}

-(void) save {
    [[NSException exceptionWithName:@"Needs subclassing" reason:@"This class needs to be subclassed before use" userInfo:nil] raise];
}

-(void) removeItem {
    [[NSException exceptionWithName:@"Needs subclassing" reason:@"This class needs to be subclassed before use" userInfo:nil] raise];
}

@end
