//
//  BarData.h
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

/** The `BarData` is the model that holds the data for each bar in your iChartView.
 */

@interface BarData : NSObject

/**
 The x-Axis label
 */
@property (retain, nonatomic) NSString* label;
/**
 The percentage value
 */
@property (nonatomic) int value;
/**
 The color used to draw the bar
 */
@property (retain, nonatomic) UIColor* color;

///---------------------
/// @name Initialization
///---------------------

/**
 Initializes an `BarData` object with the specified value and the x-axis label.
 @param value The percentage value for the bar.
 @param label The x-Axis label.
 @return The newly-initialized BarData object
*/
- (id) initWithValue:(int) value forLabel:(NSString*) label;
    
/**
 Initializes an `BarData` object with the specified value and the x-axis label.
 @param value The percentage value for the bar.
 @param label The x-Axis label.
 @param color The color of the bar.
 @return The newly-initialized BarData object
*/
- (id) initWithValue:(int) value forLabel:(NSString*) label withColor:(UIColor*) color;

@end
