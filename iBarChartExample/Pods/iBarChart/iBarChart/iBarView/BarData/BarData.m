//
//  BarData.m
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
