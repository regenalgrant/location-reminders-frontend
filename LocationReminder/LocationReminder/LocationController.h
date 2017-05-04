//
//  LocationController.h
//  LocationReminder
//
//  Created by regenal grant on 5/3/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import <Foundation/Foundation.h>

@import MapKit;
@protocol LocationControllerDelegate <NSObject>

@required
-(void)locationControllerUpdateedLocation:(CLLocation *)location;


@end

@interface LocationController : NSObject

+ (LocationController *)sharedLocation;

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *location;
@property (strong, nonatomic) id delegate;

-(void)startMonitoringForRegion:(CLRegion *)region;

@end
