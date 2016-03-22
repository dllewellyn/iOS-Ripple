//
//  BaseResponderViewController.m
//  Ripple
//
//  Created by Daniel Llewellyn on 22/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "BaseResponderViewController.h"

@interface BaseResponderViewController ()

@end

@implementation BaseResponderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.lblDescription setText:self.responder.responderDescription];
    [self.lblTitle setText:self.responder.name];
    [self.tvShareText setText:self.responder.shareString];
    [self.swtchLocation setOn:self.responder.shareLocation];
    [self setTitle:self.responder.name];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(IBAction) switchChanged :(id) sender {
    self.responder.shareLocation = self.swtchLocation.isOn;
}

-(void) viewWillDisappear:(BOOL)animated {
    self.responder.shareString = self.tvShareText.text;
    [self.responders saveToFile];
}

@end
