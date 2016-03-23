//
//  ExtraRespondersTableViewController.h
//  Ripple
//
//  Created by Daniel Llewellyn on 20/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExtraResponderTableViewCell.h"

/** This is the table view controller for displaying our 'extra responders' e.g. our internal
 responders like twitter e.g. */
@interface ExtraRespondersTableViewController : UITableViewController<ResponderChange>

@end
