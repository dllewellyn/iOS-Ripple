//
//  BaseResponderViewController.h
//  Ripple
//
//  Created by Daniel Llewellyn on 22/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Responder.h"
#import "InternalResponders.h"

@interface BaseResponderViewController : UIViewController

// Display the title
@property IBOutlet UILabel *lblTitle;

// The label for description
@property IBOutlet UILabel *lblDescription;

// Text view for share text
@property IBOutlet UITextView *tvShareText;

// Text view for location
@property IBOutlet UISwitch * swtchLocation;

// A specific responder
@property Responder *responder;

// A list of all responders
@property InternalResponders *responders;

/**
 Switch changed
 */
-(IBAction) switchChanged :(id) sender;

@end
