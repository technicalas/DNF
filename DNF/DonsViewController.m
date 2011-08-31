//
//  DonsViewController.m
//  DNF
//
//  Created by Daniel Rueda Jimenez on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DonsViewController.h"
#import "DonsWebViewController.h"

@implementation DonsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    options = [[NSArray alloc] initWithObjects:@"Ou vont vos dons", @"Je donne maintenant", nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [options release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DonsWebViewController *detailsView = nil;
    
    switch (indexPath.row) {
        case 0:
            detailsView = [[DonsWebViewController alloc] initWithNibName:@"DonsWebView" bundle:nil];
            detailsView.title = @"Google";
            detailsView.pageURL = [NSURL URLWithString:@"http://www.google.com"];
            [self.navigationController pushViewController:detailsView animated:YES];
            break;
        case 1:
            detailsView = [[DonsWebViewController alloc] initWithNibName:@"DonsWebView" bundle:nil];
            detailsView.title = @"Yahoo";
            detailsView.pageURL = [NSURL URLWithString:@"http://www.yahoo.com"];
            [self.navigationController pushViewController:detailsView animated:YES];
            break;
        default:
            break;
    }
    [detailsView release];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [options count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"donsCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        [cell autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.text = [options objectAtIndex:indexPath.row];
    
    return cell;
    
}

@end
