//
//  iChartView.m
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

#import "iChartView.h"
#import "iBarView.h"

@interface iChartView()

@property (weak, nonatomic) IBOutlet UIView *mChartContainerView;
@property int mGraphMaxValue;

@end

@implementation iChartView

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self loadNibFile];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self loadNibFile];
	}
	return self;
}

- (void) loadNibFile {
	UIView* view			=	[[[NSBundle bundleForClass:[self class]] loadNibNamed:@"iChartView" owner:self options:nil] firstObject];
	[self addSubview:view];
	[view setFrame:self.bounds];
}

- (void) drawChartForPercentages:(NSMutableArray*) data {
    [self drawChartForValues:data withMaxValue:100];
}

- (void) drawChartForValues:(NSMutableArray*) data withMaxValue:(long) maxValue {
    // clear any previous cells before adding new ones
    [self.mChartContainerView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.mGraphMaxValue         =    (int) maxValue;
    
    iBarView *latestCell        =    nil;
    for(int i = 0; i < [data count]; i++) {
        BarData* currentItem                        =    [data objectAtIndex:i];
        iBarView *cell                              =    [[iBarView alloc] init];
        cell.tag                                    =    i;
        cell.barData                                =    currentItem;
        
        [cell setValueLabel:currentItem.label];
        
        UITapGestureRecognizer *singleTap           =   [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didSelectBarView:)];
        [cell addGestureRecognizer:singleTap];
        
        cell.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self.mChartContainerView addSubview:cell];
        
        [self.mChartContainerView addConstraint:[NSLayoutConstraint constraintWithItem:cell attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.mChartContainerView attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0f]];
        [self.mChartContainerView addConstraint:[NSLayoutConstraint constraintWithItem:cell attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.mChartContainerView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]];
        
        if(i == 0) {
            [self.mChartContainerView addConstraint:[NSLayoutConstraint constraintWithItem:cell attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.mChartContainerView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0.0f]];
        } else if(i == [data count] - 1) {
            [self.mChartContainerView addConstraint:[NSLayoutConstraint constraintWithItem:cell attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:latestCell attribute:NSLayoutAttributeRight multiplier:1.0f constant:0.0f]];
            [self.mChartContainerView addConstraint:[NSLayoutConstraint constraintWithItem:cell attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.mChartContainerView attribute:NSLayoutAttributeRight multiplier:1.0f constant:0.0f]];
            
            [self.mChartContainerView addConstraint:[NSLayoutConstraint constraintWithItem:cell attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:latestCell attribute:NSLayoutAttributeWidth multiplier:1.0f constant:0.0f]];
        } else {
            [self.mChartContainerView addConstraint:[NSLayoutConstraint constraintWithItem:cell attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:latestCell attribute:NSLayoutAttributeRight multiplier:1.0f constant:0.0f]];
            
            [self.mChartContainerView addConstraint:[NSLayoutConstraint constraintWithItem:cell attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:latestCell attribute:NSLayoutAttributeWidth multiplier:1.0f constant:0.0f]];
        }
        
        latestCell        =    cell;
    }
    
    [self performSelector:@selector(updateValuesAnimatedWithMaxValue) withObject:nil afterDelay:0.5];
}

- (void) updateValuesAnimatedWithMaxValue {
    [self updateBarValueAtIndex:[NSNumber numberWithInt:0]];
}

- (void) updateBarValueAtIndex:(NSNumber*) index {
    int i = [index intValue];

    if(i < self.mChartContainerView.subviews.count) {
        iBarView* barView           =   [self.mChartContainerView.subviews objectAtIndex:i];
        
        float percentage                            =    (barView.barData.value / (self.mGraphMaxValue * 1.0)) * 100;
        
        if(barView.barData.color)
            [barView setValue:percentage withColor:barView.barData.color];
        else
            [barView setValue:percentage];
        i++;
        [self performSelector:@selector(updateBarValueAtIndex:) withObject:[NSNumber numberWithInt:i] afterDelay:0.1];
    }
}

- (void) didSelectBarView:(UITapGestureRecognizer *)recognizer {
    iBarView* selectedBar       =   ((iBarView*)recognizer.view);
    if(selectedBar.isHighlighted) {
        [selectedBar setHighlighted:NO];
        
        if(self.mSelectionDelegate && [self.mSelectionDelegate respondsToSelector:@selector(didClearSelection)]) {
            [self.mSelectionDelegate didClearSelection];
        }
        
        return;
    }
    for (iBarView* barView in self.mChartContainerView.subviews) {
        [barView setHighlighted:NO];
    }
    
    [selectedBar setHighlighted:YES];
    
    if(self.mSelectionDelegate && [self.mSelectionDelegate respondsToSelector:@selector(didSelectBarAtIndex:WithData:)]) {
        [self.mSelectionDelegate didSelectBarAtIndex:(int)selectedBar.tag WithData:selectedBar.barData];
    }
}

@end
