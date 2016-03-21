//
//  Responder.h
//  Ripple
//
//  Created by Daniel Llewellyn on 21/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Responder : NSObject

/** 
 Init this responder with all needed fields
 
 @param name name of the Responder
 @param description description of the responder
 @param viewController can be nil (to use default controller) or specify a VC that can be 
 used to configure this property
 */
-(instancetype _Nullable) initWithName:(NSString * _Nonnull) name andDescription:(NSString * _Nonnull) description andViewController:(UIViewController * _Nullable) viewController;

// Name of the responder
@property NSString * _Nullable name;

// Description of the responder
@property NSString *_Nullable responderDescription;

// Is the responder enabled or not at present
@property BOOL enabled;

// View controller that will handle this object
@property UIViewController * _Nullable viewHandler;

@end
