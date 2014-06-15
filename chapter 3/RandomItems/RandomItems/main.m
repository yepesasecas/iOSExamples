//
//  main.m
//  RandomItems
//
//  Created by Andres Yepes on 6/11/14.
//  Copyright (c) 2014 Limonada de Mango. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LDMItem.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        LDMItem *backpack   = [[LDMItem alloc] initWithItemName:@"Backpack"];
        LDMItem *calculator = [[LDMItem alloc] initWithItemName:@"Calculator"];
        
        [items addObject:backpack];
        [items addObject:calculator];
        
        backpack.containedItem = calculator;
        
        backpack   = nil;
        calculator = nil;
        
        for (LDMItem *item in items ){
            NSLog(@"%@", item);
        }
        
        NSLog(@"Setting items to nil...");
        items = nil;
    }
    return 0;
}

