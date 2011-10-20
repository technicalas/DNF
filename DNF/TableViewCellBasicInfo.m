//
//  TableViewCellBasicInfo.m
//  DNF
//
//  Created by Gloria Jimenez Mendez on 18/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TableViewCellBasicInfo.h"

@implementation TableViewCellBasicInfo
@synthesize lblUsername;
@synthesize lblPlacename;

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

- (void)dealloc {
    
    [lblUsername release];
    [lblPlacename release];
    [super dealloc];
}

@end
