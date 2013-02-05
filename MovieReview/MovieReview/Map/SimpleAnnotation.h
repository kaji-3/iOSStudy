//
//  SimpleAnnotation.h
//  MovieReview
//
//  Created by y_kajikawa on 13/02/06.
//  Copyright (c) 2013年 y_kajikawa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface SimpleAnnotation :NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
    NSString *annotationTitle;
    NSString *annotationSubtitle;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString *annotationTitle;
@property (nonatomic, retain) NSString *annotationSubtitle;
- (id)initWithLocationCoordinate:(CLLocationCoordinate2D) _coordinate
                           title:(NSString *)_annotationTitle subtitle:(NSString *)_annotationannSubtitle;
- (NSString *)title;
- (NSString *)subtitle;

@end