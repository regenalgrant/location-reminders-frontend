//
//  Reminder.m
//  LocationReminder
//
//  Created by regenal grant on 5/4/17.
//  Copyright © 2017 regenal grant. All rights reserved.
//

#import "Reminder.h"

@implementation Reminder

@dynamic name;
@dynamic location;
@dynamic radius;

+ (void)load {
    
    [super load];
    
    [self registerSubclass];
    
}

+ (NSString *)parseClassName {
    
    return @"Reminder";
    
}

@end
