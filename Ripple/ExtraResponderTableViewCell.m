//
//  ExtraResponderTableViewCell.m
//  Ripple
//
//  Created by Daniel Llewellyn on 21/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "ExtraResponderTableViewCell.h"

@interface ExtraResponderTableViewCell()

// Responder
@property  Responder * _Nonnull mResponder;

@end

@implementation ExtraResponderTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void) setResponder:(Responder * _Nonnull) responder {
    _mResponder = responder;
    
    _lblDescription.text = responder.responderDescription;
    _lblTitle.text = responder.name;
    [_swtchEnabled setOn:responder.enabled];
    [_swtchEnabled addTarget:self action:@selector(setState:) forControlEvents:UIControlEventValueChanged];
}

-(void) setState:(id) sender {
    UISwitch * swtch = (UISwitch *) sender;
    self.mResponder.enabled = swtch.isOn;
    
    if (self.delegate != nil)
    {
        [self.delegate responderChanged:self.mResponder];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+(NSInteger) getHeight {
    return 100;
}

@end
