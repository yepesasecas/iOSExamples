//
//  LDMItem.h
//  RandomItems
//
//  Created by Andres Yepes on 6/11/14.
//  Copyright (c) 2014 Limonada de Mango. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDMItem : NSObject

@property (nonatomic, strong) LDMItem *containedItem;
@property (nonatomic, weak) LDMItem *container;

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int      valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;

+(instancetype) randomItem;
-(instancetype) initWithItemName:(NSString *) name
                  valueInDollars:(int) value
                    serialNumber:(NSString *) number;
-(instancetype) initWithItemName:(NSString *) name;
@end
