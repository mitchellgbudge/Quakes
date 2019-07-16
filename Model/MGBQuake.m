//
//  MGBQuake.m
//  Quakes
//
//  Created by Mitchell Budge on 7/16/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import "MGBQuake.h"

@implementation MGBQuake

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _identifier = dictionary[@"id"];
        NSDictionary *properties = dictionary[@"properties"];
        _magnitude = [properties[@"mag"] doubleValue];
        _place = properties[@"place"];
        long timeInMilliseconds = [dictionary[@"properties"][@"time"] longValue];
        NSTimeInterval timeInSeconds = (NSTimeInterval)timeInMilliseconds / 1000.0;
        _time = [NSDate dateWithTimeIntervalSince1970:timeInSeconds];
        NSArray *coordinates = dictionary[@"geometry"][@"coordinates"];
        CLLocationDegrees longitude = [coordinates[0] doubleValue];
        CLLocationDegrees latitude = [coordinates[1] doubleValue];
        _location = CLLocationCoordinate2DMake(latitude, longitude);
        
    }
    return self;
}

@end
