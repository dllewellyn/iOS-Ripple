//
//  URLSchemeHandler.h
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef RegisterURL
#define RegisterURL "ripple://com.ripple.register"
#define CompleteURL "ripple://com.ripple.complete"
#endif

@interface URLSchemeHandler : NSObject

/**
 handle a URL coming in
 @param url url that we received
 @param applicationName that we received
 
 @returns success or not
 */
-(BOOL) handleWithUrl:(NSURL* _Nonnull) url andApplicationName:(NSString * _Nonnull) applicationName;

@end
