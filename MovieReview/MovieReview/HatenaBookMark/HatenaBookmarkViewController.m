//
//  HatenaBookmarkViewController.m
//  MovieReview
//
//  Created by y_kajikawa on 13/02/07.
//  Copyright (c) 2013年 y_kajikawa. All rights reserved.
//

#import "HatenaBookmarkViewController.h"
#import "HatenaBookmarkDetailViewController.h"

@interface HatenaBookmarkViewController ()

@end

@implementation HatenaBookmarkViewController

// テーブルのデータ・ソース
@synthesize bookMarks;

@synthesize nowIndexPath;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    // navigation Barの左側に[reload]ボタンを表示する。
    self.navigationItem.leftBarButtonItem
    = [[[UIBarButtonItem    alloc]
        initWithTitle:@"reload"
        style:UIBarButtonItemStylePlain
        target:self action:@selector(reload)] autorelease];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    bookMarks = [NSArray array];
    
    [self getBookmark];
    
    self.tableView.tableHeaderView = tableHeaderView;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void) getBookmark {
    NSURL *url = [NSURL URLWithString:@"http://b.hatena.ne.jp/entry/json/http://www.hatena.ne.jp/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        self.bookMarks = [jsonDictionary objectForKey:@"related"];
        
        [self.tableView reloadData];

    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // セクション数は１
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [bookMarks count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSLog(@"index: %d", indexPath.row);
    NSDictionary *bookMark = [self.bookMarks objectAtIndex:indexPath.row];
    cell.textLabel.text = [bookMark objectForKey:@"title"];
    NSLog(@"item count: %d", [bookMark count]);   
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // seque はstoryboradで実施する
}

#pragma seque

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // サブ画面のビューコントローラを取得
    HatenaBookmarkDetailViewController *destViewController = (HatenaBookmarkDetailViewController *)[segue destinationViewController];
    
    
    NSDictionary *bookMark = [self.bookMarks objectAtIndex:[self.tableView indexPathForSelectedRow].row];
    
    // サブ画面のmsgValueプロパティに文字列を代入
    destViewController.title = [bookMark objectForKey:@"title"];
    destViewController.count = [bookMark objectForKey:@"count"];
    destViewController.url = [bookMark objectForKey:@"url"];

}

@end
