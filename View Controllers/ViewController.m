//
//  ViewController.m
//  Quakes
//
//  Created by Mitchell Budge on 7/16/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import "ViewController.h"
#import "MGBQuakeFetcher.h"
#import "MGBQuake.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MGBQuakeFetcher *quakeFetcher = [[MGBQuakeFetcher alloc] init];
    [quakeFetcher fetchQuakesWithCompletionBlock:^(NSArray * _Nonnull quakes, NSError * _Nonnull error) {
        NSLog(@"Count: %lu", quakes.count);
        for (MGBQuake *quake in quakes) {
            NSLog(@"%@", quake);
        }
    }];
}


@end
