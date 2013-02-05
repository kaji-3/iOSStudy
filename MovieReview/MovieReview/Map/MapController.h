//
//  MapController.h
//  MovieReview
//
//  Created by y_kajikawa on 13/02/05.
//  Copyright (c) 2013年 y_kajikawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
}

@end
