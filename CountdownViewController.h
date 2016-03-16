//
//  CountdownViewController.h
//  Ripple
//
//  Created by Daniel Llewellyn on 16/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <UIKit/UIKit.h>

/** Triggered by the MainView. Touch anywhere in 5 seconds to prevent the panic from triggering */
@interface CountdownViewController : UIViewController

// Countdown label
@property IBOutlet UILabel *lblCountdown;

/**
 Cancel the trigger
 
 @param sender - in this case the view
 
 @returns..
 */
-(IBAction) cancel: (id) sender;

@end
