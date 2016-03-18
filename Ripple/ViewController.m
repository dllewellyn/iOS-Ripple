//
//  ViewController.m
//  Ripple
//
//  Created by Daniel Llewellyn on 10/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "ViewController.h"
#import "Trigger.h"
#import "CountdownViewController.h"

@interface ViewController ()

@property CGRect bottomRect;

@property UIView *innerView;

@property UITextView *releaseText;

@property CGRect resetLocation;

@property BOOL isShown;

@end

@implementation ViewController


- (IBAction) imageMoved:(id) sender withEvent:(UIEvent *) event
{
    CGPoint point = [[[event allTouches] anyObject] locationInView:self.view];
    UIControl *control = sender;
    control.center = point;
    
    if (CGRectContainsPoint(self.bottomRect, point))
    {
        [self.lblRelease setHidden:YES];
        [self.lblSwipeDown setHidden:NO];
    }
    else
    {
        [self.lblRelease setHidden:NO];
        [self.lblSwipeDown setHidden:YES];
    }
}

- (IBAction) imageDropped:(id) sender withEvent:(UIEvent *) event
{
    CGPoint point = [[[event allTouches] anyObject] locationInView:self.view];
    if (CGRectContainsPoint(self.bottomRect, point))
    {
        [self performSegueWithIdentifier:@"ShowCountdown" sender:self];
    }
    else
    {
        [self.lblRelease setHidden:NO];
        [self.lblSwipeDown setHidden:YES];
    }
    
    self.btnTrigger.layer.frame = CGRectMake(self.resetLocation.origin.x / 2,
                                             self.resetLocation.origin.y,
                                             self.resetLocation.size.height,
                                             self.resetLocation.size.width);
    
}


-(CGRect) loadSquare:(CGFloat) heightWidth {
    CGFloat y = CGRectGetMaxY(self.view.frame);
    CGFloat x = CGRectGetMaxX(self.view.frame);
    
    return CGRectMake(x / 2 - (heightWidth / 2),
                      y - ((heightWidth / 2) + 150),
                      heightWidth,
                      heightWidth);
}

-(UIView *) createView:(CGRect) rect {
   UIView *returnView = [[UIView alloc] initWithFrame:rect];
    [returnView.layer setCornerRadius:rect.size.width / 2];
    return returnView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self endTestMode];
    
    [self.btnTrigger addTarget:self action:@selector(imageMoved:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [self.btnTrigger addTarget:self action:@selector(imageDropped:withEvent:) forControlEvents:UIControlEventTouchUpInside];
   
    
    UIView *vi1 = [self createView:[self loadSquare:100]];
    /*#03a9f4*/
    [vi1 setBackgroundColor:[UIColor colorWithRed:0.012 green:0.663 blue:0.957 alpha:1] ];
    [self.view addSubview:vi1];
    [self.view sendSubviewToBack:vi1];

    
    UIView *vi = [self createView:[self loadSquare:150]];
     /*#2196f3*/
    [vi setBackgroundColor:[UIColor colorWithRed:0.129 green:0.588 blue:0.953 alpha:1]];
    [self.view addSubview:vi];
    [self.view sendSubviewToBack:vi];
    
    self.bottomRect = [self loadSquare:200];
    self.innerView = [self createView:self.bottomRect];

    [self.innerView setBackgroundColor:[UIColor blueColor]];
    
    [self.view addSubview:self.innerView];
    [self.view sendSubviewToBack:self.innerView];

    self.resetLocation = self.btnTrigger.layer.frame;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowCountdown"])
    {
        CountdownViewController* vc = (CountdownViewController*)[segue destinationViewController];
        vc.isTest = self.isTest;
    }
}

#pragma UI Actions

// When the toggle on screen is changed
-(IBAction) toggleTestMode:(id)sender {
    UISwitch * switchTestOnOff = (UISwitch*) sender;
    if (switchTestOnOff.isOn)
    {
        [self startTestMode];
    }
    else
    {
        [self endTestMode];
    }
}

// Start the test mode
-(void) startTestMode {
    self.isTest = YES;
    [self.lblTestRun setHidden:NO];
}

// End test mode
-(void) endTestMode {
    self.isTest = NO;
    [self.lblTestRun setHidden:YES];
}
@end

