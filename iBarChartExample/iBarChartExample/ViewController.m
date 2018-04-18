//
//  ViewController.m
//  iBarChartExample
//
//  Created by El Mahdi Boukhris on 16/04/2018.
//  Copyright © 2018 El Mahdi Boukhris. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupFakeData];
    [self drawChart];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setupFakeData {
    self.mDataArray             =   [NSMutableArray array];
    
    
    [self.mDataArray addObject:[[BarData alloc] initWithValue:95 forLabel:@"01/18"]];
    [self.mDataArray addObject:[[BarData alloc] initWithValue:90 forLabel:@"02/18"]];
    [self.mDataArray addObject:[[BarData alloc] initWithValue:85 forLabel:@"03/18"]];
    [self.mDataArray addObject:[[BarData alloc] initWithValue:25 forLabel:@"04/18"]];
    [self.mDataArray addObject:[[BarData alloc] initWithValue:10 forLabel:@"05/18"]];
    [self.mDataArray addObject:[[BarData alloc] initWithValue:70 forLabel:@"06/18"]];
}

- (void) drawChart {
    [self.mChartView setDelegate:self];
    
    [self.mChartView drawChartForPercentages:self.mDataArray];
}

- (void)didSelectBarAtIndex:(int)index WithData:(BarData *)data {
    NSLog(@"didSelectBarAtIndex : %d", index);
}

@end
