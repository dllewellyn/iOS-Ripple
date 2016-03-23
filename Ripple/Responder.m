//
//  Responder.m
//  Ripple
//
//  Created by Daniel Llewellyn on 21/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "Responder.h"

@implementation Responder

// Name of the responder
const NSString *name = @"title";

// Is the responder enabled
const NSString *enabled = @"enabled";

// Description of the responder
const NSString *description = @"description";

// Share text
const NSString *shareText = @"share_text";

// Share the location when you trigger panic
const NSString *shareLocation = @"share_location";

-(instancetype _Nullable) initWithDicitonary:(NSDictionary *)dictionary {
    self  = [self initWithName:dictionary[name]
                andDescription:dictionary[description]
             andViewController:nil
                andShareString:dictionary[shareText] andShareLocation:[dictionary[shareLocation] boolValue] andIsEnabled:[dictionary[enabled] boolValue]];
    return self;
}

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

-(NSDictionary *) getDictionaryForResponder {
    NSDictionary *temp = @{ name : self.name,
                            description: self.responderDescription,
                            shareLocation: [NSNumber numberWithBool:self.shareLocation],
                            shareText: self.shareString,
                            enabled:  [NSNumber numberWithBool:self.enabled] };
    return temp;
}

-(void) saveAction {
    // Do nothing
}

-(void) triggerAction {
    // Do nothing
}
@end
