//
//  MGBQuakeFetcher.m
//  Quakes
//
//  Created by Mitchell Budge on 7/16/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import "MGBQuakeFetcher.h"

@implementation MGBQuakeFetcher

- (void)fetchQuakesFromDateInterval:(NSDateInterval *)dateInterval
                    completionBlock:(MGBQuakeFetcherCompletionBlock)completionBlock {
    
}

- (void)fetchQuakesWithCompletionBlock:(MGBQuakeFetcherCompletionBlock)completionBlock {
    NSDate *endDate = [NSDate date];
    NSDate *startDate = [NSCalendar.currentCalendar dateByAddingUnit:NSCalendarUnitDay value:-1 toDate:endDate options:0];
    NSDateInterval *dateInterval = [[NSDateInterval alloc] initWithStartDate:startDate endDate:endDate];
    [self fetchQuakesFromDateInterval:dateInterval completionBlock:completionBlock];
}

@end
