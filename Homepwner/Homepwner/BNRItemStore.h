//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Tian, Di on 6/9/16.
//  Copyright © 2016 Tian, Di. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;  // Comparing to #import "BNRItem.h", this only tells the compiler the class' existence, not details.

@interface BNRItemStore : NSObject

@property (nonatomic, readonly, copy) NSArray *allItems;

// Notice that this is a class method and prefixed with a + instead of a -
+ (instancetype)sharedStore;

- (BNRItem *)createItem;
- (void)removeItem:(BNRItem *)item;
- (void)moveItemAtIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;
- (BOOL)saveChanges;
- (NSArray *)allAssetTypes;

@end
