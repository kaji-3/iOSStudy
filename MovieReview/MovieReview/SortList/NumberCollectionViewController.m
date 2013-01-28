//
//  NumberCollectionViewController.m
//  MovieReview
//
//  Created by y_kajikawa on 13/01/27.
//  Copyright (c) 2013年 y_kajikawa. All rights reserved.
//

#import "NumberCollectionViewController.h"

@interface NumberCollectionViewController ()

@property (nonatomic, strong) NSMutableArray *sortTargetNumbers;
@property (nonatomic, strong) NSMutableArray *sortedNumbers;

@end

@implementation NumberCollectionViewController

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
    [self initDatasource];
    [self sortInteger];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// セクションの数を返す
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

// Viewに表示するセルの数を返す
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:
                            (NSInteger)section {
    return [self.sortTargetNumbers count];
}

// 各セルを描画する度に呼ばれ、描画するセルを返す
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Cell"
                                                                                forIndexPath:indexPath];
    
    UILabel* numberLabel = (UILabel*)[cell viewWithTag:23];
    NSUInteger index = (NSUInteger)indexPath.row;
    numberLabel.text = [[self.sortTargetNumbers objectAtIndex:index] stringValue];
    
        
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

// セルに表示するデータの初期化を行う
- (void)initDatasource{
    const int DATA_SOURCE_COUNT = 15;

    self.sortTargetNumbers = [NSMutableArray array];
    self.sortedNumbers = [NSMutableArray array];

    srand(time(nil));
    for(int i = 0; i < DATA_SOURCE_COUNT; i++){
        //FIX: ランダムな値の範囲定数化
        [self.sortTargetNumbers addObject:[NSNumber numberWithShort:rand()%100]];
    }
}

// 表示する対象をソートする
- (void)sortInteger
{
 
    int nowLargestNumber = 0;
    int nowLargestNumberIndex = -1;
    int nowNumberIndex = 0;
    for (NSNumber *target in self.sortTargetNumbers) {
        NSLog([target stringValue]);
        if (nowLargestNumber >= [target intValue]) {
            nowLargestNumber = [target intValue];
            nowLargestNumberIndex = nowNumberIndex;
        }
        nowNumberIndex++;
    }
    
    for (NSNumber *target in self.sortTargetNumbers) {
        NSLog([target stringValue]);
    }
}

@end
