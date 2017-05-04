//
//  ViewController.m
//  LocationReminder
//
//  Created by regenal grant on 5/1/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "ViewController.h"
#import "AddReminderViewController.h"

@import Parse;
@import MapKit;
@import CoreLocation;


@interface ViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@property(weak, nonatomic)IBOutlet MKMapView *mapView;
@property(strong, nonatomic)CLLocationManager *locationManager;
@property(strong, nonatomic)MKPointAnnotation *point;

@end

@implementation ViewController

- (void)viewDidLoad{
[super viewDidLoad];

    [self requestPermissions];
    self.mapView.showsUserLocation = YES;
    self.mapView.delegate = self;
}
-(void)requestPermissions {
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter  = 100;
    self.locationManager.delegate        = self;
    
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager startUpdatingLocation];
   // [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [super prepareForSegue:segue sender:sender];
    
    if ([segue.identifier isEqualToString:@"AddReminderViewController"] && [sender isKindOfClass:[MKAnnotationView class]]){
        
        MKAnnotationView *annotationView = (MKAnnotationView *)sender;
                                               
        AddReminderViewController  *newReminderViewController = (AddReminderViewController *) segue.destinationViewController;
                                               
        newReminderViewController.coordinate = annotationView.annotation.coordinate;
        newReminderViewController.annotationTitle = annotationView.annotation.title;
    }
}



- (IBAction)LocationLongTouch:(id)sender{
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake (47.6566674, -122);
    
    MKCoordinateRegion region         = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
    MKPointAnnotation *point          = [[MKPointAnnotation alloc] init];
    point.coordinate                  = coordinate;
    point.title                       = @"Cupertino";
    [self.mapView addAnnotation:point];
    [self.mapView setRegion:region animated: YES];

}
- (IBAction)userLongPressed:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        CGPoint touchPoint = [sender locationInView:self.mapView];
        CLLocationCoordinate2D coordinate = [self.mapView convertPoint:touchPoint
                                                  toCoordinateFromView:self.mapView];
        
        MKPointAnnotation *newPoint = [[MKPointAnnotation alloc]init];
        
        newPoint.coordinate = coordinate;
        
        self.title = @"New Location";
        
        [self.mapView addAnnotation:newPoint];
    }
}

- (IBAction)LocationLongTouchTwo:(id)sender{
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake (47.0379, -122.9);
    
    MKCoordinateRegion region         = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
    MKPointAnnotation *point          = [[MKPointAnnotation alloc] init];
    point.coordinate                  = coordinate;
    point.title                       = @"Olympia";
    [self.mapView addAnnotation:point];
    [self.mapView setRegion:region animated: YES];
    
}

- (IBAction)LocationLongTouchThree:(id)sender{

    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake (40.7128, -74.00);
    
    MKCoordinateRegion region         = MKCoordinateRegionMakeWithDistance(coordinate, 500.0, 500.0);
    MKPointAnnotation *point          = [[MKPointAnnotation alloc] init];
    point.coordinate                  = coordinate;
    point.title                       = @"New York";
    [self.mapView addAnnotation:point];
    [self.mapView setRegion:region animated: YES];
    
}
-(void)locationManager:(CLLocationManager *)manager
    didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    CLLocation *location              = locations.lastObject;
    MKCoordinateRegion region         = MKCoordinateRegionMakeWithDistance(location.coordinate, 500.0, 500.0);
    [self.mapView setRegion:region animated: YES];
    
}
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
//    if ([annotation isKindOfClass:[MKUserLocation class]]) {
//        return nil;
//    }
    
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"annotationView"];
    
    annotationView.annotation = annotation;
    
    if (!annotationView) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotation"];
    }
    annotationView.canShowCallout = YES;
    annotationView.animatesDrop = YES;
    
    UIButton *rightCalloutAccessory = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    annotationView.rightCalloutAccessoryView = rightCalloutAccessory;
    
    return annotationView;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    NSLog(@"Acessory Tapped");
    [self performSegueWithIdentifier:@"AddReminderViewController" sender:view];
    
}
@end
