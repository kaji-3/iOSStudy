//
//  HelloWorld.m
//  HelloWorld
//
//  Created by y_kajikawa on 13/01/05.
//  Copyright (c) 2013年 y_kajikawa. All rights reserved.
//

#import "HelloWorld.h"

// HelloWorldの実装
@implementation HelloWorld

// 初期化
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// 描画
- (void)drawRect:(CGRect)rect
{
    UIFont* font = [UIFont systemFontOfSize:24];
    [@"Hello, World" drawAtPoint:CGPointMake(0,0) withFont:font];
}
@end
