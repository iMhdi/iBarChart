//
//  iBarView.m
//  iBarChart
//
//  Created by El Mahdi Boukhris on 17/04/2018.
//  Copyright © 2018 El Mahdi Boukhris. All rights reserved.
//

#import "iBarView.h"

#define BAR_RED_COLOR			    [UIColor colorWithRed:251.0/255.0 green:0.0/255.0 blue:6.0/255.0 alpha:1.0]
#define BAR_YELLOW_COLOR			[UIColor colorWithRed:253.0/255.0 green:149.0/255.0 blue:10.0/255.0 alpha:1.0]
#define BAR_GREEN_COLOR			    [UIColor colorWithRed:15.0/255.0 green:113.0/255.0 blue:1.0/255.0 alpha:1.0]

@implementation iBarView

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
	UIView* view			=	[[[NSBundle bundleForClass:[self class]] loadNibNamed:@"iBarView" owner:self options:nil] firstObject];
	[self addSubview:view];
	[view setFrame:self.bounds];
}

- (void)setValue:(int)value {
	if(value < 40) {
		[self.mBarView setBackgroundColor:BAR_RED_COLOR];
	} else if(value > 40 && value < 70) {
		[self.mBarView setBackgroundColor:BAR_YELLOW_COLOR];
	} else {
		[self.mBarView setBackgroundColor:BAR_GREEN_COLOR];
	}
	
	self.mBarHeightConstraint = [self constraintWithIndientifer:@"BarHeightConstraint" InView:self.mBarView.superview];

	[self changeMultiplier:self.mBarHeightConstraint to:(value / 100.0)];
}

- (void) setValue:(int) value withColor:(UIColor*) color {
    [self.mBarView setBackgroundColor:color];
	
    self.mBarHeightConstraint = [self constraintWithIndientifer:@"BarHeightConstraint" InView:self.mBarView.superview];
	
	[self changeMultiplier:self.mBarHeightConstraint to:(value / 100.0)];
}

- (void) setValueLabel:(NSString*) valueLabel {
	[self.mValueLabel setValueLabel:valueLabel];
}

- (void)changeMultiplier:(NSLayoutConstraint*)constraint to:(CGFloat)newMultiplier{
	NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem:constraint.firstItem attribute:constraint.firstAttribute relatedBy:constraint.relation toItem:constraint.secondItem attribute:constraint.secondAttribute multiplier:newMultiplier constant:constraint.constant];
	newConstraint.identifier				=	@"BarHeightConstraint";
	[self.mBarView.superview removeConstraint:constraint];
	[self.mBarView.superview addConstraint:newConstraint];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self layoutIfNeeded];
    }];
}

- (NSLayoutConstraint *)constraintWithIndientifer:(NSString *)identifer InView:(UIView *)view {
	NSLayoutConstraint * constraintToFind = nil;
	for (NSLayoutConstraint * constraint in view.constraints ) {
		if([constraint.identifier isEqualToString:identifer]){
			constraintToFind = constraint;
			break;
		}
	}
	return constraintToFind;
}

- (void)setHighlighted:(BOOL)highlighted {
    _isHighlighted          =   highlighted;
    
    if(highlighted) {
        [UIView animateWithDuration:0.1 animations:^{
            self.mValueLabel.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
        }];
    } else {
        [UIView animateWithDuration:0.1 animations:^{
            self.mValueLabel.transform = CGAffineTransformIdentity;
        }];
    }
}

@end
