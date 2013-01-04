//
//  ViewController.m
//  HelloWorld
//
//  Created by y_kajikawa on 13/01/05.
//  Copyright (c) 2013年 y_kajikawa. All rights reserved.
//

#import "ViewController.h"

// ViewControllerの実装
@implementation ViewController

// 初期化
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// ロード時に呼ばれる
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

// メモリ警告時に呼ばれる
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
