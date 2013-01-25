//
//  WebBrowserController.m
//  MovieReview
//
//  Created by y_kajikawa on 13/01/25.
//  Copyright (c) 2013年 y_kajikawa. All rights reserved.
//

#import "WebBrowserController.h"

@interface WebBrowserController ()

@end

@implementation WebBrowserController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self loadWebPage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_webView release];
    [super dealloc];
}

- (void)loadWebPage {
    NSURL *url = [NSURL URLWithString:@"http://www.yahoo.co.jp"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:req];
}
@end
