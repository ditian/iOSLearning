//
//  Item.h
//  RandomItems
//
//  Created by Tian, Di on 6/6/16.
//  Copyright © 2016 Tian, Di. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
/*{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
    
    Item *_containedItem;  // Strong reference... _containedItem is like a descendant.
    __weak Item *_container;  // Weak reference... _container is like an ancestor.
}*/
+ (instancetype)randomItem;

// Designated initializer for Item
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name
                    serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;

@property (nonatomic, strong) Item *containedItem;
@property (nonatomic, weak) Item *container;

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;

@end
