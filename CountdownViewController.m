//
//  CountdownViewController.m
//  Ripple
//
//  Created by Daniel Llewellyn on 16/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "CountdownViewController.h"
#import "Trigger.h"

@interface CountdownViewController ()

// Countdown timer
@property NSTimer *timer;

// Countdown remaining
@property NSInteger countdownRemaining;

@property BOOL shouldCancel;

@end

@implementation CountdownViewController

// Number of seconds for countdown
const NSInteger TOTAL_COUNTDOWN = 5;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.countdownRemaining = TOTAL_COUNTDOWN;
    self.timer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target:self selector:@selector(updateCountdown) userInfo:nil repeats: YES];
    self.shouldCancel = NO;
    
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(cancel:)];
    [self.view addGestureRecognizer:singleFingerTap];
}

-(IBAction) cancel: (UIEvent *) event {
    self.shouldCancel = YES;
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// Update the countdown
-(void) updateCountdown {
    
    self.countdownRemaining--;
    [self.lblCountdown setText:[NSString stringWithFormat:@"%ld", (long)self.countdownRemaining]];
    
    if (self.countdownRemaining <= 0)
    {
        [self.timer invalidate];
        
        if (!self.shouldCancel)
        {
            if (![Trigger trigger:nil])
            {
                UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Ops" message:@"There are no responders configured" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
                }];
                
                [controller addAction:cancel];
                
                [self presentViewController:controller animated:YES completion:nil];
            }
            else
            {
                [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
            }

        }

    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
