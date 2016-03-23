//
//  RegisteredAppTableViewController.m
//  Ripple
//
//  Created by Daniel Llewellyn on 14/03/2016.
//  Copyright © 2016 Daniel Llewellyn. All rights reserved.
//

#import "RegisteredAppTableViewController.h"
#import "RegisteredApplicationList.h"
#import "RegisteredApplicationFactory.h"

@interface RegisteredAppTableViewController ()

// Registered application list
@property RegisteredApplicationList *list;

@end

@implementation RegisteredAppTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.list = [RegisteredApplicationFactory getDefaultApplicationList];
    [self.list reload];
    self.list.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - DataChanged

-(void) dataAdded:(RegisteredApplication *)addedAppliation {
    [self.list reload];
    [self.tableView reloadData];
}

-(void) dataChangedAtIndex:(NSInteger)index {
    [self.list reload];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppReuseId" forIndexPath:indexPath];
   
    RegisteredApplication *app = [self.list objectAtIndex:indexPath.row];
    [cell.textLabel setText:app.applicationName];
    [cell.detailTextLabel setText:app.applicationDescription];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle) editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        RegisteredApplication *app =  [self.list objectAtIndex:indexPath.row];
        [app removeItem];
        [app save];
        [self.list reload];
        [self.tableView reloadData];
    }
}



@end
