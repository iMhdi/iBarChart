//
//  ChartView.h
//  iBarChart
//
//  Created by El Mahdi Boukhris on 17/04/2018.
//  Copyright © 2018 El Mahdi Boukhris. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BarData.h"

@protocol iBarSelectionDelegate <NSObject>

@optional
- (void) didSelectBarAtIndex:(int) index WithData:(BarData*) data;
- (void) didClearSelection;

@end

@interface iChartView : UIView

@property (retain, setter=setDelegate:) id mSelectionDelegate;

- (void) drawChartForPercentages:(NSMutableArray*) data;
- (void) drawChartForValues:(NSMutableArray*) data withMaxValue:(long) maxValue;

@end
