//
//  Responder.m
//  Ripple
//
//  Created by Daniel Llewellyn on 21/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "Responder.h"

@implementation Responder

-(instancetype _Nullable) initWithName:(NSString * _Nonnull) name andDescription:(NSString * _Nonnull) description andViewController:(UIViewController * _Nullable) viewController andShareString:(NSString * _Nonnull) shareString andShareLocation:(BOOL) shouldSharelocation andIsEnabled:(BOOL) isEnabled
{
    
    self = [self init];
    
    if (self != nil)
    {
        self.name = name;
        self.responderDescription = description;
        self.viewHandler = viewController;
        self.shareLocation = shouldSharelocation;
        self.shareString = shareString;
        self.enabled = isEnabled;
    }
    
    return self;
}

@end
