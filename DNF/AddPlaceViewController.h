//
//  AddPlaceViewController.h
//  DNF
//
//  Created by Gloria Jimenez Mendez on 18/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCellBasicInfo.h"

@interface AddPlaceViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
{
    TableViewCellBasicInfo *cellInfoBasic;
    UITableView *_tableView;
    
    NSArray *sections;
}

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet TableViewCellBasicInfo *cellInfoBasic;
- (IBAction)addPhoto:(id)sender;

@end
