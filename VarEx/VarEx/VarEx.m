//
//  VarEx.m
//  VarEx
//
//  Created by y_kajikawa on 13/01/19.
//  Copyright (c) 2013年 y_kajikawa. All rights reserved.
//

#import "VarEx.h"

@implementation VarEx

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    
    if(self){
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    // 日付用データの作成
    NSDate* date = [NSDate date];
    NSString* text = [date description];
    
    [text drawAtPoint:CGPointMake(0, 0) withFont:[UIFont systemFontOfSize:24]];
}

@end
