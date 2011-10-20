//
//  CategoriesViewController.h
//  DNF
//
//  Created by Gloria Jimenez Mendez on 18/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCellCategories.h"

@interface CategoriesViewController : UITableViewController
{
    TableViewCellCategories *cellCategories;
    NSArray *sections;
    NSArray *titleForSections;
}

@property (nonatomic, retain) IBOutlet TableViewCellCategories *cellCategories;
- (IBAction)selectedOption:(id)sender;

@end
