//
//  DonsViewController.h
//  DNF
//
//  Created by Daniel Rueda Jimenez on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DonsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *options;
    UIImage *_backgroundCellUp;
    UIImage *_backgroundCellDown;
    UITableView *_tableView;
}

@property (nonatomic, retain) UIImage *backgroundCellUp;
@property (nonatomic, retain) UIImage *backgroundCellDown;
@property (nonatomic, retain) IBOutlet UITableView *tableView;

@end
