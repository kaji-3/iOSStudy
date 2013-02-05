//
//  SimpleAnnotation.m
//  MovieReview
//
//  Created by y_kajikawa on 13/02/06.
//  Copyright (c) 2013年 y_kajikawa. All rights reserved.
//

#import "SimpleAnnotation.h"

@implementation SimpleAnnotation
@synthesize coordinate;
@synthesize annotationTitle;
@synthesize annotationSubtitle;

- (NSString *)title {
    return annotationTitle;
}

- (NSString *)subtitle {
    return annotationSubtitle;
}

- (id)initWithLocationCoordinate:(CLLocationCoordinate2D) _coordinate
                           title:(NSString *)_annotationTitle subtitle:(NSString *)_annotationSubtitle {
    coordinate = _coordinate;
    self.annotationTitle = _annotationTitle;
    self.annotationSubtitle = _annotationSubtitle;
    return self;
}

- (void) dealloc {
    [annotationTitle release];
    [annotationSubtitle release];
    [super dealloc];
}

@end