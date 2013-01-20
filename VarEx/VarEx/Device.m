//
//  Device.m
//  VarEx
//
//  Created by y_kajikawa on 13/01/19.
//  Copyright (c) 2013年 y_kajikawa. All rights reserved.
//

#import "Device.h"

@implementation Device

@synthesize name = _name;
@synthesize version = _version;

- (id)init{
    self=[super init];
    if (self) {
        _name = @"";
        _version = 0;
    }
    return self;
}

- (void)dealloc {
    [_name release];
    [super dealloc];
}


- (NSString*) info {
    return [NSString stringWithFormat:@"%@のバージョンは%d", _name, _version];
}

@end
