//
//  ViewController.h
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// Trigger button
@property IBOutlet UIButton *btnTrigger;

/**
 Perform trigger action
 */
-(IBAction) trigger:(id)sender;
@end

