//
//  BNRColorDescription.m
//  Colorboard
//
//  Created by Tian, Di on 7/11/16.
//  Copyright © 2016 Tian, Di. All rights reserved.
//

#import "BNRColorDescription.h"

@implementation BNRColorDescription

- (instancetype)init {
    self = [super init];
    if (self) {
        _color = [UIColor colorWithRed:0 green:0 blue:1 alpha:1];
        _name = @"Blue";
    }
    return self;
}

@end
