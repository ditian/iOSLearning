//
//  BNRDetailViewController.h
//  Homepwner
//
//  Created by Tian, Di on 6/14/16.
//  Copyright © 2016 Tian, Di. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;

@interface BNRDetailViewController : UIViewController <UIViewControllerRestoration>

- (instancetype)initForNewItem:(BOOL)isNew;

@property (nonatomic, strong) BNRItem *item;
@property (nonatomic, copy) void (^dismissBlock)(void);

@end
