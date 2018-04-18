//
//  iBarView.h
//  iBarChart
//
//  Created by El Mahdi Boukhris on 17/04/2018.
//  Copyright © 2018 El Mahdi Boukhris. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VerticalLabel.h"
#import "BarData.h"

IB_DESIGNABLE
@interface iBarView : UIView

@property (retain, nonatomic) BarData* barData;

@property BOOL isHighlighted;

@property (weak, nonatomic) IBOutlet UIView *mBarView;
@property (weak, nonatomic) IBOutlet VerticalLabel *mValueLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mBarHeightConstraint;
@property (weak, nonatomic) IBOutlet UIView *mRightDivider;

@property (nonatomic) IBInspectable int value;
@property (nonatomic) IBInspectable NSString* valueLabel;

- (void) setValue:(int) value withColor:(UIColor*) color;

- (void) setHighlighted:(BOOL) highlighted;

@end
