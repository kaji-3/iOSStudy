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

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initHeader];
    [self initIndicator];
    [self loadWebPage:@"http://www.yahoo.co.jp"];
}

- (void)initHeader
{
    [self.view addSubview:webHeaderView];
}

- (void) initIndicator {
    // インジケーターインスタンスを作る
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    // タグ指定
    indicator.tag = 1;
    
    // 画面の中央に表示するようにframeを変更する
    float w = indicator.frame.size.width;
    float h = indicator.frame.size.height;
    float x = self.view.frame.size.width/2 - w/2;
    float y = self.view.frame.size.height/2 - h/2;
    indicator.frame = CGRectMake(x, y, w, h);
    
    // 止まったら終了
    indicator.hidesWhenStopped = YES;
    
    // 雰囲気出すために背景を黒く半透明する
    indicator.backgroundColor = [UIColor blackColor];
    indicator.alpha = 0.5f;
    indicator.color = [UIColor whiteColor];
    
    // サブビューに追加する
    [self.view addSubview:indicator];
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
    // ステータスヘッダーに出す場合
    //[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    UIActivityIndicatorView *indicator = (UIActivityIndicatorView*) [self.view viewWithTag:1];
    // クルクルと回し始める
    [indicator startAnimating];
}

// ページ読込完了時にインジケータを非表示にする
-(void)webViewDidFinishLoad:(UIWebView*)webView{
    // ステータスヘッダーのを止める倍
    //[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    UIActivityIndicatorView *indicator = (UIActivityIndicatorView*) [self.view viewWithTag:1];
    // 停止させる
    [indicator stopAnimating];
    
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
