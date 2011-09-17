//
//  UITableViewCell+Beautiful.m
//  DNF
//
//  Created by Daniel Rueda Jimenez on 17/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UITableViewCell+Beautiful.h"

@implementation UITableViewCell (beautiful)

- (void)beautifulCellWithImage:(UIImage *)backgroundCell
{
    // Set the background and selected images based on row
	UIImage *rowBackground;
    
    rowBackground = backgroundCell;
    
	// Set the images in the image views, creating if necessary
	UIImageView *backgroundView = (UIImageView *)self.backgroundView;
	if (![backgroundView isKindOfClass:[UIImageView class]]) {
		backgroundView = [[[UIImageView alloc] init] autorelease];
		self.backgroundView = backgroundView;
	}
    
	backgroundView.image = rowBackground;
}

@end
