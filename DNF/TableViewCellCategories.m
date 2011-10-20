//
//  TableViewCellCategories.m
//  DNF
//
//  Created by Gloria Jimenez Mendez on 18/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TableViewCellCategories.h"

@implementation TableViewCellCategories
@synthesize txtLabel;
@synthesize scSelection;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setSegmentedControlWithItems:(NSArray *)items addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents tag:(NSInteger)tag;
{
    UISegmentedControl *sc = [[[UISegmentedControl alloc] initWithItems:items] autorelease];
    sc.tag = tag;
    sc.segmentedControlStyle = UISegmentedControlStyleBar;
    [sc setSelectedSegmentIndex:0];
    [sc addTarget:target action:action forControlEvents:controlEvents];
    [sc setFrame:CGRectMake(10, 40, sc.frame.size.width, sc.frame.size.height)];
    [self addSubview:sc];
}

- (void)dealloc {
    [txtLabel release];
    [scSelection release];
    [super dealloc];
}
@end
