//
//  DonsViewController.m
//  DNF
//
//  Created by Daniel Rueda Jimenez on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DonsViewController.h"
#import "DonsWebViewController.h"
#import "DonsInfoViewController.h"
#import "UITableViewCell+Beautiful.h"

@implementation DonsViewController
@synthesize backgroundCellUp = _backgroundCellUp;
@synthesize backgroundCellDown = _backgroundCellDown;
@synthesize tableView = _tableView;

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
    self.tableView.backgroundColor = [UIColor clearColor];
    options = [[NSArray alloc] initWithObjects:@"Ou vont vos dons", @"Je donne maintenant", nil];
    self.backgroundCellUp = [UIImage imageNamed:@"Background_TVC_Dons_Up.png"];
    self.backgroundCellDown = [UIImage imageNamed:@"Background_TVC_Dons_Down.png"];
}

- (void)viewDidUnload
{
    [self setTableView:nil];
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
    //DonsWebViewController *detailsView = nil;
    DonsInfoViewController *infoView = nil;
    switch (indexPath.row) {
        case 0:
            infoView = [[DonsInfoViewController alloc] initWithNibName:@"DonsInfoView" bundle:nil];
            [self.navigationController pushViewController:infoView animated:YES];
            [infoView release];
            break;
        case 1:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://soplo-digital.com/webdnf/donation.php"]];
            /*
            detailsView = [[DonsWebViewController alloc] initWithNibName:@"DonsWebView" bundle:nil];
            detailsView.pageURL = [NSURL URLWithString:@"http://soplo-digital.com/webdnf/donation.php"];
            [self.navigationController pushViewController:detailsView animated:YES];
            [detailsView release];
             */
            break;
        default:
            break;
    }
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
    
    cell.textLabel.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [options objectAtIndex:indexPath.row];
    
    UIImage *background = nil;
    switch (indexPath.row) {
        case 0:
            background = self.backgroundCellUp;
            break;
        case 1:
            background = self.backgroundCellDown;
        default:
            break;
    }
    
    [cell beautifulCellWithImage:background];
    
    return cell;
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
