//
//  ResgisterUrl.h
//  Ripple
//
//  Created by Daniel Llewellyn on 17/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DNLLUrlFormatter.h"

@interface DNLLRegisterUrl : DNLLUrlFormatter

// Response trigger
@property NSString *responseName;

// Description of the application that we are registering
@property NSString *appDescription;

@end
