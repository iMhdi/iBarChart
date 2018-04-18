//
//  ViewController.h
//  iBarChartExample
//
//  Created by El Mahdi Boukhris on 16/04/2018.
//  Copyright © 2018 El Mahdi Boukhris. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iChartView.h"
#import "BarData.h"

@interface ViewController : UIViewController <iBarSelectionDelegate>

@property (retain, nonatomic) NSMutableArray* mDataArray;

@property (weak, nonatomic) IBOutlet iChartView *mChartView;

@end
