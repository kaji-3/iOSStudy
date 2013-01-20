//
//  VarEx.m
//  VarEx
//
//  Created by y_kajikawa on 13/01/19.
//  Copyright (c) 2013年 y_kajikawa. All rights reserved.
//

#import "VarEx.h"
#import "Device.h"

@implementation VarEx

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// メモリ解放
- (void)dealloc {
    [super dealloc];
}

// 画面初期化
- (id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    
    if(self){
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    [[UIColor blackColor]set];
    UIFont* font =[UIFont systemFontOfSize:24];
    NSString* text;
    
    Device* device = [[[Device alloc] init ] autorelease ];
    
    device.name = @"iphone";
    device.version = 6;
    
    text = [device info];
    [text drawAtPoint:CGPointMake(100, 200) withFont:font];
}

@end
