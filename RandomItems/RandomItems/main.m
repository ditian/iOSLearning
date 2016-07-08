//
//  main.m
//  RandomItems
//
//  Created by Tian, Di on 6/6/16.
//  Copyright © 2016 Tian, Di. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create a mutable array object, store its address in items available.
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        Item *backpack = [[Item alloc] initWithItemName:@"Backpack"];
        [items addObject:backpack];
        
        Item *calculator = [[Item alloc] initWithItemName:@"Calculator"];
        [items addObject:calculator];
        
        backpack.containedItem = calculator;
        
        backpack = nil;
        calculator = nil;
        
        // For every item in the items array...
        for (Item *item in items) {
            // Log the description of item
            NSLog(@"%@", item);
        }
        
        NSLog(@"Setting items to nil...");
        // Destroy the mutable array object
        items = nil;
    }
    return 0;
}
