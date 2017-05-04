//
//  LocationController.m
//  LocationReminder
//
//  Created by regenal grant on 5/3/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "LocationController.h"
#import "ViewController.h"

@import UserNotifications;

@interface LocationController () <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;


@end

@implementation LocationController



+ (instancetype *)shared {
    
    static LocationController *shared = nil;
    
    static  dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        shared = [[[self class]alloc] init];
        
        
    });
    
    return shared;
}

- (instancetype) init {
    self = [super init];
    if (self) {
        [self requestPermissions];
        
    }

- (void)requestPermission {
    
    _locationManager = [[CLLocationManager alloc]init];
    
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    _locationManager.distanceFilter = 5;
    
    [_locationManager requestAlwaysAuthorization];
    
    [_locationManager startUpdatingLocation];
    

    
-(void)startMonitoringForRegion:(CLRegion *)region {
    
    [self.locationManager startMonitoringForRegion:region];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    CLLocation *location = locations.lastObject;
    
    NSLog(@"Coordinate %f, %f - Altitude: %f", location.coordinate.latitude, location.coordinate.longitude, location.altitude);
    
    self.location = location;
    
    [self.delegate locationControllerUpdatedLocation:location];
    
}
    
-(void)locationMangager:(CLLocationManager *)manager didstartMonitoringForRegion:(CLRegion *)region {
    
    NSLog(@"WE have successfully started montoring changes for regiom: %@", region.identifier);
}


-(void)setLocationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    
    NSLog(@"User Did Enter Region: %@", region.identifier);
    UNMutableNotificationContent *content  = [[UNMutableNotificationContent alloc]init];
    content.title = @"Reminder";
    content.body [NSString stringWithFormat: @"%@", region.identifier];
    content.sound = [UNNotificationSound defaultSound];
    
    UNTimeIntercalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTomeInterval:0.1 repeat:NO];
    UNNotificationRequest *request = [UNNotificationRequestt requestWithIdentifier:@"Location Entered" content:content trigger:trigger];
    UNUserNotificationCenter *current = [UNNotificationCenter currentNotificationCenter];
    [current removeAllPendingNotificationRequests];
    [current addNotificationRequest:requeset withCompletionHandler: >(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error Posting User Notification: %@", error.localizedDescription);
        }
            
    }];
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    
    NSLog(@"there wa an error: %@", error.NSLocalizedDescription);
    }
-(void)localManager:(CLLocationManager *)manager didVisit:(CLVisit *)visit {
    
    NSLog(@"This is here for no reason....But heres a visit: %@", visit);
}
}
@end
