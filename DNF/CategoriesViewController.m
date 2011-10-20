//
//  CategoriesViewController.m
//  DNF
//
//  Created by Gloria Jimenez Mendez on 18/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CategoriesViewController.h"

@implementation CategoriesViewController
@synthesize cellCategories;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
    [sections release];
    [titleForSections release];
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
    self.title = @"Categories";
    titleForSections = [[NSArray alloc] initWithObjects:@"Type", @"Chauffé", @"Ensoleillement", @"Nombre de places", @"Fumeur", nil];
    NSArray *firstSection = [NSArray arrayWithObjects:@"Cafe", @"Resto", @"Autre", nil];
    NSArray *secondSection = [NSArray arrayWithObjects:@"Oui", @"Non", nil];
    NSArray *thirdSection = [NSArray arrayWithObjects:@"Matin", @"Midi", @"Après-midi", nil];
    NSArray *fourthSection = [NSArray arrayWithObjects:@"-10", @"10 à 20", @"+20", nil];
    NSArray *fifthSection = [NSArray arrayWithObjects:@"Oui", @"Non", nil];
    sections = [[NSArray alloc] initWithObjects:firstSection, secondSection, thirdSection, fourthSection, fifthSection, nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.cellCategories = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)valueChangeForSegmentedControl:(id)segmented
{
    if ([segmented isKindOfClass:[UISegmentedControl class]]) {
        NSLog(@"Tag %d", ((UISegmentedControl *)segmented).tag);
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TableViewCellCategories";
    
    TableViewCellCategories *cell = (TableViewCellCategories *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"TableViewCellCategories" 
                                      owner:self
                                    options:nil]; // Create a new instance
        cell = cellCategories;
        self.cellCategories = nil;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.txtLabel.text = [titleForSections objectAtIndex:indexPath.section];
    NSArray *elements = [sections objectAtIndex:indexPath.section];
    [cell setSegmentedControlWithItems:elements addTarget:self action:@selector(valueChangeForSegmentedControl:) forControlEvents:UIControlEventValueChanged tag:indexPath.section];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)selectedOption:(id)sender {
}
@end
