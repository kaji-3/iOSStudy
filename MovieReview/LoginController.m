//
//  LoginController.m
//  MovieReview
//
//  Created by y_kajikawa on 13/01/21.
//  Copyright (c) 2013年 y_kajikawa. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()

@end

@implementation LoginController

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    NSLog(@"prepareForSeque>%@ - %@", [segue identifier], [[self class] description]);
}

// 画面繊維判定メソッド
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    NSLog(@"<shouldPerformSegueWithIdentifier>%@", _TxtUserID.text);
    return [self isVaid];
}

//-- リターンキーがタップされたときキーボードを隠す処理
- (IBAction)closeKeyBoard:(id)sender{
    [_TxtUserID resignFirstResponder];
}

// ユーザIDの入力チェック
- (IBAction)TxtUserId_EditingChenged:(id)sender {

    //TODO Validate ロジックの統一化
    if ([((UITextField*)sender).text length] == 0) {
        _LblUserIdValidateResult.text = @"必須入力";
    } else if ([((UITextField*)sender).text length] > 10) {
        _LblUserIdValidateResult.text = @"10文字以内でよろ";
    } else {
        _LblUserIdValidateResult.text = @"";
    }
}

// 画面全体の入力チェック
- (BOOL)isVaid{
    
    if ([_TxtUserID.text length] != 0
        &&  [_TxtPassword.text length] != 0) {
        return YES;
    } else {
        UIAlertView *alert =
        [[UIAlertView alloc] initWithTitle:@"エラー" message:@"入力エラーがあります。"
                                  delegate:self cancelButtonTitle:@"確認" otherButtonTitles:nil];
        [alert show];
        return NO;
    }
}

- (void)dealloc {

    [_TxtUserID release];
    [_TxtPassword release];
    [_LblUserIdValidateResult release];
    [super dealloc];
}
@end
