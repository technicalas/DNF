//
//  HomeViewController.h
//  DNF
//
//  Created by Daniel Rueda Jimenez on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *options;
    UITableView *_tableView;
    UIImage *_backgroundCell;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) UIImage *backgroundCell;

@end
