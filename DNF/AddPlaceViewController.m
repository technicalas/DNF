//
//  AddPlaceViewController.m
//  DNF
//
//  Created by Gloria Jimenez Mendez on 18/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AddPlaceViewController.h"
#import "CategoriesViewController.h"
#import "AddressViewController.h"
#import "DescriptionViewController.h"

@implementation AddPlaceViewController
@synthesize tableView = _tableView;
@synthesize cellInfoBasic;

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
    
    NSArray *basicInfoSection = [NSArray arrayWithObjects:@"", nil];
    NSArray *addressSection = [NSArray arrayWithObjects:@"Adresse", @"Horaires", nil];
    NSArray *adicionalInfoSection = [NSArray arrayWithObjects:@"Téléphone", @"Catégories", @"Description", nil];
    
    sections = [[NSArray alloc] initWithObjects:basicInfoSection, addressSection, adicionalInfoSection, nil];
    
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
    self.cellInfoBasic = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [_tableView release];
    [cellInfoBasic release];
    [super dealloc];
}

#pragma mark - UITableViewDataSource
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return [sections count];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *subsection = [sections objectAtIndex:section];
    if (subsection == nil) {
        return 0;
    }
    return [subsection count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return cellInfoBasic;
    }
    
    static NSString *cellID = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID] autorelease];
    }
    
    cell.textLabel.text = [[sections objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    if (section == 1 && row == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if (section == 2 && (row == 1 || row == 2)){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            break;
        case 1:
            if (indexPath.row == 0) {
                AddressViewController *addressView = [[AddressViewController alloc] initWithNibName:@"AddressView" bundle:nil];
                [self.navigationController pushViewController:addressView animated:YES];
                [addressView release];
            }
            break;
        case 2:
            if (indexPath.row == 1) {
                CategoriesViewController *categoriesView = [[CategoriesViewController alloc] initWithNibName:@"CategoriesView" bundle:nil];
                [self.navigationController pushViewController:categoriesView animated:YES];
                [categoriesView release];  
            }else if (indexPath.row == 2){
                DescriptionViewController *descriptionView = [[DescriptionViewController alloc] initWithNibName:@"DescriptionView" bundle:nil];
                [self.navigationController pushViewController:descriptionView animated:YES];
                [descriptionView release];
            }
            break;
        default:
            break;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 80;
    }
    return 44;
}

- (IBAction)addPhoto:(id)sender
{
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
