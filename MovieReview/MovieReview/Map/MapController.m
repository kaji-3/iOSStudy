//
//  MapController.m
//  MovieReview
//
//  Created by y_kajikawa on 13/02/05.
//  Copyright (c) 2013年 y_kajikawa. All rights reserved.
//

#import "MapController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "SimpleAnnotation.h"

@interface MapController ()

@end

@implementation MapController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 位置情報の取得
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    
    if ([CLLocationManager locationServicesEnabled]) {
        [_locationManager startUpdatingLocation];
    }
}

// 位置情報更新時に呼ばれるハンドラ
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{
    
    // 表示範囲の指定
    MKCoordinateSpan span = MKCoordinateSpanMake(0.005f, 0.005f);
    // 更新された位置をマップの中心に設定
    CLLocationCoordinate2D coordinate = newLocation.coordinate;
    MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);
    MKMapView *mapView = (MKMapView*) self.view;
    [mapView setRegion:region animated:true];
    
    // 指定位置にピンをドロップ
    [mapView addAnnotation:
     [[[SimpleAnnotation alloc]initWithLocationCoordinate:coordinate
                                                    title:@"大手町駅"
                                                 subtitle:@"千代田線・半蔵門線・丸ノ内線・東西線・三田線"]autorelease]];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc{
    [_locationManager stopUpdatingLocation];
    [_locationManager dealloc];
    [super dealloc];
}

@end
