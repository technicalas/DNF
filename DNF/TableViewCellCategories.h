//
//  TableViewCellCategories.h
//  DNF
//
//  Created by Gloria Jimenez Mendez on 18/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCellCategories : UITableViewCell
{
    
}

@property (retain, nonatomic) IBOutlet UILabel *txtLabel;
@property (retain, nonatomic) IBOutlet UISegmentedControl *scSelection;

- (void)setSegmentedControlWithItems:(NSArray *)items addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents tag:(NSInteger)tag;

@end
