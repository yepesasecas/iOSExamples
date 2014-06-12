//
//  LDMContainer.m
//  RandomItems
//
//  Created by Andres Yepes on 6/11/14.
//  Copyright (c) 2014 Limonada de Mango. All rights reserved.
//

#import "LDMContainer.h"

@implementation LDMContainer
//----------------------------------------------------------
// INITIALIZERS
//----------------------------------------------------------

-(instancetype)initWithsubitemName:(NSString *)name
                    valueInDollars:(int)value
                      serialNumber:(NSString *)number
                          subitems:(NSArray *)subitems{
    self = [super initWithItemName:name
                    valueInDollars:value
                      serialNumber:number];
    if (self) {
        _subitems = subitems;
    }
    return self;
}

-(instancetype)init{
    return [self initWithsubitemName:@"default"
                      valueInDollars:55
                        serialNumber:@"A1B1C"
                            subitems:[NSArray arrayWithObject:[LDMItem randomItem]]];
}
//----------------------------------------------------------
// CLASS METHODS
//----------------------------------------------------------

+(instancetype)createContainer{
    NSMutableArray *subitems = [[NSMutableArray alloc] init];
    for (int i = 0; i <= 10; i++) {
        LDMItem *item = [LDMItem randomItem];
        [subitems addObject:item];
    }
    
    return [[self alloc]initWithsubitemName:@"Prueba"
                             valueInDollars:23
                               serialNumber:@"1A2C"
                                   subitems:subitems];
}
//----------------------------------------------------------
// INSTANCE METHODS
//----------------------------------------------------------

-(NSArray *)subitems{
    return _subitems;
}

-(int)containerValue{
    int value = self.valueInDollars;
    for (LDMContainer *subitem in self.subitems){
        value += subitem.valueInDollars;
    }
    return value;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"Container- name:%@ value:%d, subitems:%@", self.itemName, self.containerValue , self.subitems];
}
@end
