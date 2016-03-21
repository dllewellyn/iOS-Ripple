//
//  ExtraResponderTableViewCell.m
//  Ripple
//
//  Created by Daniel Llewellyn on 21/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "ExtraResponderTableViewCell.h"

@implementation ExtraResponderTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

+(NSInteger) getHeight {
    return 100;
}

@end
