//
//  ViewController.m
//  LocationReminder
//
//  Created by regenal grant on 5/1/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "ViewController.h"

@import Parse;
@import MapKit;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad
{
    //[self requestPermissions];
    self.mapView.showsUserLocation    = YES;
    [super viewDidLoad];
}

- (IBAction)LocationLongTouch:(id)sender
{

        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake (47.6566674, -122);
    
        MKCoordinateRegion region         = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
    
        [self.mapView setRegion:region animated: YES];



}

- (IBAction)LocationLongTouchTwo:(id)sender
{
    
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake (47.0379, -122.9);
    
        MKCoordinateRegion region         = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
    
        [self.mapView setRegion:region animated: YES];
    
}
- (IBAction)LocationLongTouchThree:(id)sender
{

        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake (40.7128, -74.00);

        MKCoordinateRegion region         = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);

        [self.mapView setRegion:region animated: YES];


    
}

@end
