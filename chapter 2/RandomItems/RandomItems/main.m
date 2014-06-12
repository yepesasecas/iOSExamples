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
        
        for (int i = 0; i <= 10; i++) {
            LDMItem *item = [LDMItem randomItem];
            [items addObject:item];
        }
        
        for (int i = 0; i<=11; i++) {
            NSLog(@"%@", [items objectAtIndex:i]);
        }
        items = nil;
    }
    return 0;
}

