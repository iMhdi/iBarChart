//
//  VerticalLabel.m
//  iBarChart
//
//  Created by El Mahdi Boukhris on 17/04/2018.
//  Copyright © 2018 El Mahdi Boukhris. All rights reserved.
//

#import "VerticalLabel.h"

@interface VerticalLabel()

@property (weak, nonatomic) IBOutlet UILabel *mValueLabel;

@end

@implementation VerticalLabel

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
	UIView* view			=	[[[NSBundle bundleForClass:[self class]] loadNibNamed:@"VerticalLabel" owner:self options:nil] firstObject];
	[self addSubview:view];
	[view setFrame:self.bounds];
	
	[self.mValueLabel setTransform:CGAffineTransformMakeRotation(-M_PI / 2)];
}

- (void)setValueLabel:(NSString *)valueLabel {
	[self.mValueLabel setText:valueLabel];
}

@end
