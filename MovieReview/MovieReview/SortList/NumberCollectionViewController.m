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

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *header = nil;
    
    if ([kind isEqual:UICollectionElementKindSectionHeader])
    {
        header = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                    withReuseIdentifier:@"MyHeader"
                                                           forIndexPath:indexPath];
        
        //header.headerLabel.text = @"Car Image Gallery";
    }
    return header;
}

// 画面描画時に呼ばれ、Viewに表示するセルの数を返す
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:
                            (NSInteger)section {
    return [self.sortedNumbers count];
}

// 各セルを描画する度に呼ばれ、描画するセルを返す
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Cell"
                                                                                forIndexPath:indexPath];
    
    UILabel* numberLabel = (UILabel*)[cell viewWithTag:23];
    NSUInteger index = (NSUInteger)indexPath.row;
    numberLabel.text = [[self.sortedNumbers objectAtIndex:index] stringValue];
    
        
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
    // sort用作業変数
    int nowLargestNumber = 0;
    int nowLargestNumberIndex = -1;
    
    while ([self.sortTargetNumbers count] != 0){
        
        NSNumber *sortTarget = (NSNumber*) [self.sortTargetNumbers objectAtIndex:0];
        nowLargestNumber = [sortTarget intValue];
        nowLargestNumberIndex = 0;
                
        for (int nowNumberIndex = 0; nowNumberIndex < [self.sortTargetNumbers count]; nowNumberIndex++) {
            
            NSNumber *compareTarget = (NSNumber*) [self.sortTargetNumbers objectAtIndex:nowNumberIndex];
            
            //FIXIT: デバッグログ
            NSLog([NSString stringWithFormat:@"%@ %@ %d",@"compareTarget",[compareTarget stringValue],nowLargestNumber]);

            if (nowLargestNumber <= [compareTarget intValue]) {
                nowLargestNumber = [compareTarget intValue];
                nowLargestNumberIndex = nowNumberIndex;
            }
        }
        
        // 最大値の元配列からの削除と表示用配列への追加
        [self.sortTargetNumbers removeObjectAtIndex:nowLargestNumberIndex];
        [self.sortedNumbers addObject:[NSNumber numberWithShort:nowLargestNumber]];
        
        //FIXIT: デバッグログ
        //NSLog(nowLargestNumber);
        
    }
}


- (IBAction)shuffleButton_TouchDown:(id)sender {
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:@"お知らせ" message:@"完了しました"
                              delegate:self cancelButtonTitle:@"確認" otherButtonTitles:nil];
    [alert show];

}


- (void)dealloc {
    [_shuffleButton release];
    [super dealloc];
}
@end
