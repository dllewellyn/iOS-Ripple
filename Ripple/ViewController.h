//
//  ViewController.h
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <UIKit/UIKit.h>

/** Main view controller. Drag down the drop to trigger */
@interface ViewController : UIViewController

// Trigger button
@property IBOutlet UIButton *btnTrigger;

// Release me label
@property IBOutlet UILabel *lblSwipeDown;

// Release
@property IBOutlet UILabel *lblRelease;

/**
 Perform trigger action
 */
-(IBAction) trigger:(id)sender;
@end

