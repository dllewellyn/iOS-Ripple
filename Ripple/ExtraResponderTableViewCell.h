//
//  ExtraResponderTableViewCell.h
//  Ripple
//
//  Created by Daniel Llewellyn on 21/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Responder.h"

@protocol ResponderChange <NSObject>

// Responder change
// @param responder responder item that has changed
-(void) responderChanged:(Responder * _Nullable) responder;

@end

@interface ExtraResponderTableViewCell : UITableViewCell {
    // Description label
    IBOutlet UILabel * _lblDescription;
    
    // Title label
    IBOutlet UILabel * _lblTitle;
    

};

@property (weak, nonatomic) id<ResponderChange> delegate;

// UI switch
@property IBOutlet UISwitch * _Nonnull swtchEnabled;

/** set the responder that we're presenting
 
 @param responder that we're showing
 */
-(void) setResponder:(Responder * _Nonnull) responder;

/**
  Get the cell height
 
 @return cell height
 */
+(NSInteger) getHeight;


@end
