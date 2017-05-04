//
//  AddReminderViewController.m
//  LocationReminder
//
//  Created by regenal grant on 5/2/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "AddReminderViewController.h"
#import "Reminder.h"


@interface AddReminderViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *setReminderButton;
@property (weak, nonatomic) IBOutlet UITextField *locationTitleField;
@property (weak, nonatomic) IBOutlet UITextField *locationRadiusField;

@end

@implementation AddReminderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(IBAction)setSetReminder:(UIButton *)sender {
    Reminder *newReminder = [Reminder object];
    
    newReminder.name = self.annotationTitle;
    newReminder.location = [PFGeoPoint geoPointWithLatitude:self.coordinate.latitude longitude:self.coordinate.longitude];
    
    [newReminder saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        NSLog(@"Annotation Title: %@", self.locationTitleField.text);
        NSLog(@"Coordinate: %f, %f", self.coordinate.latitude, self.coordinate.latitude);
        NSLog(@"Save Reminder Successful: %i - Error %@", succeeded, error.localizedDescription);
        NSLog(@"Radius Number: %@", self.locationRadiusField.init);
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ReminderSavedToparse" object:nil];
        if (self.completion) {
            CGFloat radius = [self.locationRadiusField.text floatValue];
                MKCircle *circle = [MKCircle circleWithCenterCoordinate:self.coordinate radius:radius];
                
                self.completion(circle);
                [self.navigationController popViewControllerAnimated:YES];
            }
        }];
}

@end
