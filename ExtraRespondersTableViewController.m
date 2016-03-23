//
//  ExtraRespondersTableViewController.m
//  Ripple
//
//  Created by Daniel Llewellyn on 20/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "ExtraRespondersTableViewController.h"
#import "ResponderFactory.h"
#import "TwitterResponderViewController.h"
#import "URLSchemeHandler.h"
#import "ResponderUrlAdapter.h"

@interface ExtraRespondersTableViewController ()

@property InternalResponders *responders;

@end

@implementation ExtraRespondersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.responders = [ResponderFactory sharedInstance].respondersList;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.responders.responders count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [ExtraResponderTableViewCell getHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseId = @"ExtraCell";
    
    ExtraResponderTableViewCell *cell = (ExtraResponderTableViewCell*)[self.tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (cell == nil)
    {
        [self.tableView registerNib:[UINib nibWithNibName:@"ExtraResponderTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:reuseId];
        cell = (ExtraResponderTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:reuseId];
        [cell setResponder:[self.responders.responders objectAtIndex:indexPath.row]];
        cell.delegate = self;
        
    }
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self responderChanged:[self.responders.responders objectAtIndex:indexPath.row]];
}

#pragma ExtraResponderTableCell delegate
-(void) responderChanged:(Responder *) responder {
    
    BOOL didSave = [self.responders saveToFile];
#warning need to do something with this
    
    if (responder != nil)
    {
        DNLLUrlFormatter *url;
        
        if (responder.enabled)
        {
            BaseResponderViewController *ctrl = [[TwitterResponderViewController alloc] initWithNibName:@"TwitterResponderViewController" bundle:[NSBundle mainBundle]];
            
            ctrl.responders = self.responders;
            ctrl.responder = responder;
            
            url = [ResponderUrlAdapter registerUrlForResponder:responder];
            
            
            [self.navigationController pushViewController:ctrl animated:YES];
        }
        else
        {
            url = [ResponderUrlAdapter unRegisterUrlForResponder:responder];
        }
        
        if (url != nil && url.url != nil)
        {
            // This returns an alert view but we don't really want that here
            (void)[[[URLSchemeHandler alloc] init] handleWithUrl:url.url andApplicationName:@"Ripple"];
        }
    }
    
}

@end
