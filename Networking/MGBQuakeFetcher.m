//
//  MGBQuakeFetcher.m
//  Quakes
//
//  Created by Mitchell Budge on 7/16/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import "MGBQuakeFetcher.h"
#import "MGBQuake.h"

@implementation MGBQuakeFetcher

static NSString *baseURLString = @"https://earthquake.usgs.gov/fdsnws/event/1/query";

- (void)fetchQuakesFromDateInterval:(NSDateInterval *)dateInterval
                    completionBlock:(MGBQuakeFetcherCompletionBlock)completionBlock {
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:baseURLString];
    NSISO8601DateFormatter *formatter = [[NSISO8601DateFormatter alloc] init];
    NSString *startTimeString = [formatter stringFromDate:dateInterval.startDate];
    NSString *endTimeString = [formatter stringFromDate:dateInterval.endDate];
    NSArray *queryItems = @[
                            [NSURLQueryItem queryItemWithName:@"format" value:@"geojson"],
                            [NSURLQueryItem queryItemWithName:@"starttime" value:startTimeString],
                            [NSURLQueryItem queryItemWithName:@"endtime" value:endTimeString]
                            ];
    
    urlComponents.queryItems = queryItems;
    NSURL *url = urlComponents.URL;
    NSLog(@"URL: %@", url);
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching quakes : %@", error);
            completionBlock(nil, error);
            return;
        }
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            NSLog(@"JSON Error: %@", jsonError);
            completionBlock(nil, jsonError);
            return;
        }
        NSLog(@"JSON: %@", json);
        NSArray *earthquakeArray = json[@"features"];
        NSMutableArray *quakes = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in earthquakeArray) {
            MGBQuake *quake = [[MGBQuake alloc] initWithDictionary:dict];
            if (quake) {
            [quakes addObject:quake];
            }
        }
        completionBlock(quakes, nil);
    }];
    [task resume];
}

- (void)fetchQuakesWithCompletionBlock:(MGBQuakeFetcherCompletionBlock)completionBlock {
    NSDate *endDate = [NSDate date];
    NSDate *startDate = [NSCalendar.currentCalendar dateByAddingUnit:NSCalendarUnitDay value:-1 toDate:endDate options:0];
    NSDateInterval *dateInterval = [[NSDateInterval alloc] initWithStartDate:startDate endDate:endDate];
    [self fetchQuakesFromDateInterval:dateInterval completionBlock:completionBlock];
}

@end
