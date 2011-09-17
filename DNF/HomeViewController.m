//
//  HomeViewController.m
//  DNF
//
//  Created by Daniel Rueda Jimenez on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"
#import "InformationViewController.h"
#import "CoachViewController.h"
#import "UITableViewCell+Beautiful.h"

@implementation HomeViewController
@synthesize tableView = _tableView;
@synthesize backgroundCell = _backgroundCell;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor clearColor];
    options = [[NSArray alloc] initWithObjects:@"Zoom sur la cigarette", @"Le coach", nil];
    self.backgroundCell = [[UIImage imageNamed:@"Background_TVC_Home.png"] stretchableImageWithLeftCapWidth:10 topCapHeight:50];
}

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

- (void)viewDidUnload
{
    [self setTableView:nil];
    [self setBackgroundCell:nil];
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
    UIViewController *detailsView = nil;
    
    switch (indexPath.row) {
        case 0:
            detailsView = [[InformationViewController alloc] initWithNibName:@"InformationView" bundle:nil];
            break;
        case 1:
            detailsView = [[CoachViewController alloc] initWithNibName:@"CoachView" bundle:nil];
            break;
        default:
            break;
    }
    if (detailsView != nil) {
        [self.navigationController pushViewController:detailsView animated:YES];
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
    static NSString *cellID = @"homeCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        [cell autorelease];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.detailTextLabel.backgroundColor = [UIColor clearColor];
    
    cell.textLabel.text = [options objectAtIndex:indexPath.row];
    
    if (indexPath.row == 1) {
        cell.detailTextLabel.text = @"Arretez de fumer, connexion fb";
    }
    
    [cell beautifulCellWithImage:self.backgroundCell];
    
    return cell;
}

- (void)dealloc {
    [_tableView release];
    [_backgroundCell release];
    [super dealloc];
}
@end
