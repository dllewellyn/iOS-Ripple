//
//  DNLLTriggerUrl.h
//  Ripple
//
//  Created by Daniel Llewellyn on 17/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "DNLLUrlFormatter.h"

/** This is the URL for triggering a panic */
@interface DNLLTriggerUrl : DNLLUrlFormatter

/**
 Initialise a trigger URL
 
 @param applicationName target application for this trigger
 @param triggerScheme the scheme for the trigger
 
 @returns an instance of DNLL Trigger URL
 */
-(instancetype _Nullable) initWith:(NSString* _Nonnull) applicationName andTriggerType:(NSString* _Nonnull) triggerScheme andIsTest:(BOOL) isTest;


@end
