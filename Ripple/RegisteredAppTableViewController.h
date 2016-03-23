//
//  RegisteredAppTableViewController.h
//  Ripple
//
//  Created by Daniel Llewellyn on 14/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisteredApplicationList.h"

/** This is a list of all of the registered apps that will respond to a panic button */
@interface RegisteredAppTableViewController : UITableViewController<DataChanged>

@end
