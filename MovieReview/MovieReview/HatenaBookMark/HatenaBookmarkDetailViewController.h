//
//  HatenaBookmarkDetailViewController.h
//  MovieReview
//
//  Created by y_kajikawa on 13/02/07.
//  Copyright (c) 2013年 y_kajikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HatenaBookmarkDetailViewController : UITableViewController

// タイトル
@property (nonatomic, strong) NSString *title;

// ブックマーク数
@property (nonatomic, strong) NSString *count;

// ブックマークURL
@property (nonatomic, strong) NSString *url;


@end
