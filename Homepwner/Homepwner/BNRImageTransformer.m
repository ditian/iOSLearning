//
//  BNRImageTransformer.m
//  Homepwner
//
//  Created by Tian, Di on 6/30/16.
//  Copyright © 2016 Tian, Di. All rights reserved.
//

#import "BNRImageTransformer.h"
#import "UIKit/UIKit.h"

@implementation BNRImageTransformer

+ (Class)transformedValueClass
{
    return [NSData class];
}

- (id)transformedValue:(id)value
{
    if (!value) {
        return nil;
    }
    
    if ([value isKindOfClass:[NSData class]]) {
        return value;
    }
    
    return UIImagePNGRepresentation(value);
}

- (id)reverseTransformedValue:(id)value
{
    return [UIImage imageWithData:value];
}

@end
