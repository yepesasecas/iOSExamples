//
//  main.m
//  RandomItems
//
//  Created by Andres Yepes on 6/11/14.
//  Copyright (c) 2014 Limonada de Mango. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LDMItem.h"
#import "LDMContainer.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for (int i = 0; i <= 10; i++) {
            LDMItem *item = [LDMItem randomItem];
            [items addObject:item];
        }
        
        for (LDMItem *item in items ){
            NSLog(@"%@", item);
        }
        items = nil;
        
        
        LDMContainer *container = [LDMContainer createContainer];
        NSLog(@"%@", container);
    }
    return 0;
}

