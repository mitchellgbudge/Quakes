//
//  MGBQuake.h
//  Quakes
//
//  Created by Mitchell Budge on 7/16/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MGBQuake : NSObject

@property NSString *identifier;
@property double magnitude;
@property NSString *place;
@property NSDate *time;
@property CLLocationCoordinate2D location;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
