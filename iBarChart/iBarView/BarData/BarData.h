//
//  BarData.h
//  iBarChart
//
//  Created by El Mahdi Boukhris on 17/04/2018.
//  Copyright © 2018 El Mahdi Boukhris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BarData : NSObject

@property (retain, nonatomic) NSString* label;
@property (nonatomic) int value;
@property (retain, nonatomic) UIColor* color;

- (id) initWithValue:(int) value forLabel:(NSString*) label;
- (id) initWithValue:(int) value forLabel:(NSString*) label withColor:(UIColor*) color;

@end
