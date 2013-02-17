//
//  WebBrowserController.m
//  MovieReview
//
//  Created by y_kajikawa on 13/01/25.
//  Copyright (c) 2013年 y_kajikawa. All rights reserved.
//

#import "WebBrowserController.h"
#import "SVProgressHUD.h"

@interface WebBrowserController ()

@end

@implementation WebBrowserController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initHeader];
    [self loadWebPage:@"http://www.yahoo.co.jp"];
}

- (void)initHeader
{
    [self.view addSubview:webHeaderView];
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

- (void)loadWebPage:(NSString*) urlPath {
    NSURL *url = [NSURL URLWithString:urlPath];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:req];
}

// ページ読込開始時にインジケータをくるくるさせる
-(void)webViewDidStartLoad:(UIWebView*)webView{
    //[SVProgressHUD dismiss]; // 消す
    [SVProgressHUD show]; // ぐるぐる表示
}

// ページ読込完了時にインジケータを非表示にする
-(void)webViewDidFinishLoad:(UIWebView*)webView{
    
    [SVProgressHUD dismiss]; // 消す

    
}
- (IBAction)backButtonTouchDown:(id)sender {
    [self.webView goBack];
}

- (IBAction)fowardButtonTouchDown:(id)sender {
    [self.webView goForward];
}

- (IBAction)refleshButtonTouchDown:(id)sender {
    [self.webView reload];
}
@end
