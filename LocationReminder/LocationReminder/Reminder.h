//
//  Reminder.h
//  LocationReminder
//
//  Created by regenal grant on 5/4/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import <Parse/Parse.h>

@interface Reminder : PFObject <PFSubclassing>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) PFGeoPoint *location;
@property (strong, nonatomic) NSNumber *radius;


@end
