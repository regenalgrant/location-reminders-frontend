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

@synthesize locationManager;
@synthesize location;


@end

@implementation LocationController

+(LocationController *)sharedLocation {
    static LocationController *shared = nil;
    static  dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared =[[self alloc]init];
        
    });
    
    return shared;
}


-(LocationController *)init {
    self = [super init];
    locationManager = [[CLLocationManager alloc]init];
    return self;
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = location.last.object;
    
    [self.delegate locationControllerUpdatedLocation:location];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
