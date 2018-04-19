//
//  iBarView.h
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
#import "VerticalLabel.h"
#import "BarData.h"

/** The `iBarView` represents a single Bar in a iChartView.
 */
IB_DESIGNABLE
@interface iBarView : UIView

/**
 The `BarData` object source of data for drawing the `iBarView`.
 */
@property (retain, nonatomic) BarData* barData;

/**
 A Boolean value persisting the state of an `iBarView` (Normal || Highlighted).
 */
@property BOOL isHighlighted;

/**
 The view representing the actual vertical bar.
 */
@property (weak, nonatomic) IBOutlet UIView *mBarView;
    
/**
 An `VerticalLabel` instance representing the x-axis view.
 */
@property (weak, nonatomic) IBOutlet VerticalLabel *mValueLabel;

/**
 The constraints that defines the height of the vertical bar.
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mBarHeightConstraint;

/**
 The divider between x-axis labels.
 */
@property (weak, nonatomic) IBOutlet UIView *mRightDivider;

/**
 The percentage value of the bar.
 */
@property (nonatomic) IBInspectable int value;
    
/**
 The x-axis label value
 */
@property (nonatomic) IBInspectable NSString* valueLabel;

/**
 Populates data for an `iBarView` instance.
 @param value The percentage value of the bar.
 @param color The color in which the bar will be drawn.
 */
- (void) setValue:(int) value withColor:(UIColor*) color;

/**
 Sets whether or not the bar is highlighted.
 @param highlighted The boolean defining the status.
 */
- (void) setHighlighted:(BOOL) highlighted;

@end
