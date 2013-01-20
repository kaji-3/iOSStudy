//
//  Device.h
//  VarEx
//
//  Created by y_kajikawa on 13/01/19.
//  Copyright (c) 2013年 y_kajikawa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Device : NSObject{
    NSString* _name;
    int _version;
}


@property (nonatomic,retain)NSString* name;
@property int version;

- (NSString*)info;
@end
