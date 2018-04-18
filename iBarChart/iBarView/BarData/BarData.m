//
//  BarData.m
//  iBarChart
//
//  Created by El Mahdi Boukhris on 17/04/2018.
//  Copyright © 2018 El Mahdi Boukhris. All rights reserved.
//

#import "BarData.h"

@implementation BarData

- (id) init {
    self = [super init];
    if (self) {
        _label      =   @"";
        _value      =   0;
        _color      =   nil;
    }
    return self;
}

- (id) initWithValue:(int) value forLabel:(NSString*) label withColor:(UIColor*) color {
    self = [super init];
    if (self) {
        _label      =   label;
        _value      =   value;
        _color      =   color;
    }
    return self;
}

- (id) initWithValue:(int) value forLabel:(NSString*) label {
    return [self initWithValue:value forLabel:label withColor:nil];
}

@end
