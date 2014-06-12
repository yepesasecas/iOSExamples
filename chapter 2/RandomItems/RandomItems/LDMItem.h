//
//  LDMItem.h
//  RandomItems
//
//  Created by Andres Yepes on 6/11/14.
//  Copyright (c) 2014 Limonada de Mango. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDMItem : NSObject
{
    NSString *_itemName;
    NSString *_serialNumber;
    int       _valueInDollars;
    NSDate   *_dateCreated;
}

+(instancetype) randomItem;

-(instancetype) initWithItemName:(NSString *) name
                  valueInDollars:(int) value
                    serialNumber:(NSString *) number;

-(instancetype) initWithItemName:(NSString *) name;

-(void) setItemName: (NSString *)str;
-(NSString *) itemName;
-(void) setSerialNumber: (NSString *) str;
-(NSString *) serialNumber;
-(void) setValueInDollars: (int) value;
-(int)  valueInDollars;
-(NSDate *) dateCreated;
@end
