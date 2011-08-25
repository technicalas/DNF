//
//  DonsWebViewController.h
//  DNF
//
//  Created by Daniel Rueda Jimenez on 24/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DonsWebViewController : UIViewController {
    UIWebView *webView;
    NSURL *_pageURL;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) NSURL *pageURL;

@end
