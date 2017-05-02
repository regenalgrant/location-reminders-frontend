//
//  AddReminderViewController.h
//  LocationReminder
//
//  Created by regenal grant on 5/2/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MapKit;



@interface AddReminderViewController : UIViewController

@property (strong, nonatomic) NSString *annotationTitle;
@property (nonatomic) CLLocationCoordinate2D coordinate;

@end
