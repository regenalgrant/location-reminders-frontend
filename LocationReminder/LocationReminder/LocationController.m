//
//  LocationController.m
//  LocationReminder
//
//  Created by regenal grant on 5/3/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "LocationController.h"
#import "ViewController.h"


@interface LocationController ()

@end

@implementation LocationController
@synthesize locationManager;
@synthesize location;


+ (LocationController *)sharedLocation {
    
    static LocationController *shared = nil;
    
    static  dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        shared =[[self alloc]init];
        
    });
    
    return shared;
}


- (LocationController *)init {
    
    self = [super init];
    
    locationManager = [[CLLocationManager alloc]init];
    
    location = [[CLLocation alloc]init];
    
    return self;
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    CLLocation *location = locations.lastObject;
    
  //  [self.delegate locationControllerUpdatedLocation:location];
    
}


@end
