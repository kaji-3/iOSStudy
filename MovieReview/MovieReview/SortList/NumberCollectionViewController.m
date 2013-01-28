//
//  NumberCollectionViewController.m
//  MovieReview
//
//  Created by y_kajikawa on 13/01/27.
//  Copyright (c) 2013年 y_kajikawa. All rights reserved.
//

#import "NumberCollectionViewController.h"

@interface NumberCollectionViewController ()

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *photos;

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
    self.titles = [[NSArray alloc] initWithObjects:@"東京", @"名古屋", @"大阪", nil];
    self.photos = [[NSArray alloc] initWithObjects:@"東京", @"名古屋", @"大阪", nil];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:
                            (NSInteger)section {
    return [self.photos count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Cell"
                                                                                forIndexPath:indexPath];
    
    UILabel* numberLabel = (UILabel*)[cell viewWithTag:23];
    NSUInteger index = (NSUInteger)indexPath.row;
    numberLabel.text = [self.photos objectAtIndex:index];
    //NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    //[f setNumberStyle:NSNumberFormatterDecimalStyle];
    //NSNumber * myNumber = [f numberFromString:numberString];
    //[f release];
    
    
    
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

@end
