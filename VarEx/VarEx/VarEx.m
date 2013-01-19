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
    int num0;
    int num1;
    int sum;
    
    num0 = 100;
    num1 = 200;
    sum = num0 + num1;
    
    NSString* text = [NSString stringWithFormat:@"合計=%d", sum];
    
    [[UIColor blackColor]set];
     
    UIFont* font =[UIFont systemFontOfSize:24];
     
    [text drawAtPoint:CGPointMake(100, 200) withFont:font];
    
    [@"Hellow?" drawAtPoint:CGPointMake(0, 0) withFont:font];
    
    // Drawing code
}

@end
