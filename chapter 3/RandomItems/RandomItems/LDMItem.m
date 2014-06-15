//
//  LDMItem.m
//  RandomItems
//
//  Created by Andres Yepes on 6/11/14.
//  Copyright (c) 2014 Limonada de Mango. All rights reserved.
//

#import "LDMItem.h"

@implementation LDMItem

//----------------------------------------------------------
// INITIALIZERS
//----------------------------------------------------------

-(instancetype)init{
    return [self initWithItemName:@"item"];
}

-(instancetype)initWithItemName:(NSString *)name
                 valueInDollars:(int)value
                   serialNumber:(NSString *)number{
    self = [super init];
    if(self){
        _itemName       = name;
        _valueInDollars = value;
        _serialNumber   = number;
        _dateCreated    = [[NSDate alloc] init];
    }
    return self;
}

-(instancetype)initWithItemName:(NSString *)name{
    return [self initWithItemName:name
                   valueInDollars:0
                     serialNumber:@""];
}
//----------------------------------------------------------
// CLASS METHODS
//----------------------------------------------------------

+(instancetype)randomItem{
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    NSArray *randomNounList      = @[@"Bear", @"Spork", @"Mac"];
    
    NSInteger adjectiveIndex     = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex          = arc4random() % [randomNounList count];
    
    NSString *randomName         = [NSString stringWithFormat:@"%@ %@",
                                    randomAdjectiveList[adjectiveIndex],
                                    randomNounList[nounIndex]];
    
    int randomValue              = 100;
    
    NSString *randomSerialNumber =[NSString stringWithFormat:@"%c%c%c%c%c",
                                   '0' + arc4random() % 10,
                                   'A' + arc4random() % 26,
                                   '0' + arc4random() % 10,
                                   'A' + arc4random() % 26,
                                   '0' + arc4random() % 10];
    
    LDMItem *item = [[self alloc]initWithItemName:randomName
                                   valueInDollars:randomValue
                                     serialNumber:randomSerialNumber];
    return item;
}
//----------------------------------------------------------
// INSTANCE METHODS
//----------------------------------------------------------
-(void)setContainedItem:(LDMItem *)containedItem{
    _containedItem = containedItem;
    _container     = self;
}

-(NSString *)description{
    NSString *descriptionString = [[NSString alloc]
                                   initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                                   self.itemName,
                                   self.serialNumber,
                                   self.valueInDollars,
                                   self.dateCreated];
    return descriptionString;
}

-(void)dealloc{
    NSLog(@"Destroyed: %@", self);
}
@end
