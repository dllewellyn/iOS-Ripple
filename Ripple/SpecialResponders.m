//
//  SpecialResponders.m
//  Ripple
//
//  Created by Daniel Llewellyn on 23/03/16.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "SpecialResponders.h"
#import "TwitterResponder.h"

@implementation SpecialResponders

// Name of the twitter object
NSString * Twitter = @"TwitterRipple";

+(Responder* _Nullable) getResponder:(NSDictionary * _Nullable) dict {

    Responder *returnResponder = nil;
    
    if ([dict[name] isEqualToString:Twitter])
    {
        returnResponder = [[TwitterResponder alloc] initWithDicitonary:dict];
    }
    else
    {
        returnResponder = [[Responder alloc] initWithDicitonary:dict];
    }
    
    return returnResponder;
}

@end
