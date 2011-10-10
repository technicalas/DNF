//
//  HomeViewController.h
//  DNF
//
//  Created by Daniel Rueda Jimenez on 22/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface HomeViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *options;
    UITableView *_tableView;
    UIImage *_backgroundCell;
    UILabel *_dateLabel;
    UILabel *_daysElapsedLabel;
    MPMoviePlayerViewController *_moviePlayerView;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) UIImage *backgroundCell;
@property (nonatomic, retain) IBOutlet UILabel *dateLabel;
@property (nonatomic, retain) IBOutlet UILabel *daysElapsedLabel;

@end
