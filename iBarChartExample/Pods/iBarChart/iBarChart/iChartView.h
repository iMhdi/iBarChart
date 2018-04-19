//
//  ChartView.h
//  iBarChart
//
//  Created by El Mahdi Boukhris on 17/04/2018.
//  Copyright © 2018 El Mahdi Boukhris <m.boukhris@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//

#import <UIKit/UIKit.h>
#import "BarData.h"

/**
 The protocol that let's the app get notified when the user interacts with the Graph.
 */
@protocol iBarSelectionDelegate <NSObject>

/**
 Called when a Bar is selected inside the Graph
 @param index The index of the selected bar.
 @param data The `BarData` instance selected.
 */
@optional
- (void) didSelectBarAtIndex:(int) index WithData:(BarData*) data;
    
/**
 Called when a Bar is deselected
 */
- (void) didClearSelection;

@end

/**
 The actual Graph view
 */
@interface iChartView : UIView

@property (retain, setter=setDelegate:) id mSelectionDelegate;
    
/**
 Populates the `iChartView` using the array of `BarData` it takes as input parameter
 @param data The array of `BarData` to be represented in the Graph.
 */
- (void) drawChartForPercentages:(NSMutableArray*) data;

/**
 Populates the `iChartView` using the array of `BarData` it takes as input parameter
 @param data The array of `BarData` to be represented in the Graph.
 @param maxValue The value reprenting 100% to which each `BarData` value will be compared to get a percentage.
 */
- (void) drawChartForValues:(NSMutableArray*) data withMaxValue:(long) maxValue;

@end
