//
//  WebBrowserController.h
//  MovieReview
//
//  Created by y_kajikawa on 13/01/25.
//  Copyright (c) 2013年 y_kajikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebBrowserController : UIViewController
{
    IBOutlet UIView *webHeaderView;
    
}
@property (retain, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)backButtonTouchDown:(id)sender;
- (IBAction)fowardButtonTouchDown:(id)sender;
- (IBAction)refleshButtonTouchDown:(id)sender;

@end
