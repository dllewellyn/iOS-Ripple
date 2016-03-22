//
//  ResponderFactory.m
//  Ripple
//
//  Created by Daniel Llewellyn on 21/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "ResponderFactory.h"

@interface ResponderFactory()
// Remove readonly
@property InternalResponders *respondersList;

@end

@implementation ResponderFactory

static ResponderFactory *instance;

+(instancetype _Nullable) sharedInstance {
    if (instance == nil) {
        instance = [[ResponderFactory alloc] init];
        
        NSMutableArray *responders = [[NSMutableArray alloc] init];
        [responders addObject:[self getTwitterResponder]];
        instance.respondersList = [[InternalResponders alloc] initFromFile];
    }
    
    return instance;
}

+(Responder *) getTwitterResponder {
    Responder *responder = [[Responder alloc] initWithName:@"Twitter" andDescription:@"Send a panic tweet when you trigger the button" andViewController:nil andShareString:@"Help! I've hit the panic button!" andShareLocation:YES andIsEnabled:YES];
    return responder;
}

@end
