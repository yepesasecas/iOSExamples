//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Andres Yepes on 6/15/14.
//  Copyright (c) 2014 Limonada de Mango. All rights reserved.
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)drawRect:(CGRect)rect{
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2;
    center.y = bounds.origin.y + bounds.size.height / 2;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2;
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    path.lineWidth = 10.0;
    [[UIColor lightGrayColor] setStroke];

    for (float radius = maxRadius; 0 < radius ; radius -= 20) {
        [path moveToPoint:CGPointMake(center.x + radius, center.y)];
        [path addArcWithCenter:center
                        radius:radius
                    startAngle:0
                      endAngle:M_PI * 2
                     clockwise:YES];
        
    }
    [path stroke];
}
@end
