//
//  LoginController.h
//  MovieReview
//
//  Created by y_kajikawa on 13/01/21.
//  Copyright (c) 2013年 y_kajikawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *TxtUserID;

@property (retain, nonatomic) IBOutlet UITextField *TxtPassword;
@property (retain, nonatomic) IBOutlet UILabel *LblUserIdValidateResult;

- (IBAction)closeKeyBoard:(id)sender;

@end
