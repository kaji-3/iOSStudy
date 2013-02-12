//
//  HatenaBookmarkViewController.h
//  MovieReview
//
//  Created by y_kajikawa on 13/02/07.
//  Copyright (c) 2013年 y_kajikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HatenaBookmarkViewController : UITableViewController{
    IBOutlet UIView *tableHeaderView;
    
}

// 表示用データ・ソース
@property (nonatomic, strong) NSMutableArray *bookMarks;

// クリックしたテーブルのID
@property  (nonatomic, strong) NSIndexPath *nowIndexPath;

@end
