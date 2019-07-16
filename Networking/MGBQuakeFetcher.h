//
//  MGBQuakeFetcher.h
//  Quakes
//
//  Created by Mitchell Budge on 7/16/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^MGBQuakeFetcherCompletionBlock)(NSArray *, NSError *);

@interface MGBQuakeFetcher : NSObject

- (void)fetchQuakesFromDateInterval:(NSDateInterval *)dateInterval
                    completionBlock:(MGBQuakeFetcherCompletionBlock)completionBlock;

- (void)fetchQuakesWithCompletionBlock:(MGBQuakeFetcherCompletionBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
