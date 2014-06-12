//
//  LDMContainer.h
//  RandomItems
//
//  Created by Andres Yepes on 6/11/14.
//  Copyright (c) 2014 Limonada de Mango. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LDMItem.h"

@interface LDMContainer : LDMItem
{
    NSArray *_subitems;
}

+(instancetype) createContainer;
-(instancetype) initWithsubitemName:(NSString *)name
                     valueInDollars:(int)value
                       serialNumber:(NSString *)number
                           subitems:(NSArray *) subitems;
-(NSArray *) subitems;
-(int) containerValue;
@end
