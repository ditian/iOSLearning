//
//  BNRItem.h
//  Homepwner
//
//  Created by Tian, Di on 6/30/16.
//  Copyright © 2016 Tian, Di. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRItem : NSManagedObject

- (void)setThumbnailFromImage:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END

#import "BNRItem+CoreDataProperties.h"
