//
//  DNLLUrlFormatter.h
//  Ripple
//
//  Created by Daniel Llewellyn on 17/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+NSStringUrlEncode.h"


typedef enum {
    RegisterUrl = 0, // Register a URL in the database
    CompleteUrl = 1
} UrlTypes;

/** 
 This class is for the formatting of URLs as per the specificiation for the application.
 
 Warning: MUST BE SUBCLASSED FOR USE
 
 */
@interface DNLLUrlFormatter : NSObject

/**
 Init with URL 
 
 @param url a URL that's formatted for this class
 */
-(instancetype _Nullable) initWithUrl:(NSURL * _Nonnull) url;

// Url type that should conform to the 'UrlTypes' in the enum
@property NSInteger urlType;

@end
