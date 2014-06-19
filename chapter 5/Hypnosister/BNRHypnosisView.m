//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Andres Yepes on 6/15/14.
//  Copyright (c) 2014 Limonada de Mango. All rights reserved.
//

#import "BNRHypnosisView.h"

@interface BNRHypnosisView()

@property (strong, nonatomic) UIColor *circleColor;
@end

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor     = [UIColor lightGrayColor];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@ was touched.", self);
    float red = (arc4random() %100) / 100.0;
    float green = (arc4random() %100) / 100.0;
    float blue = (arc4random() %100) / 100.0;
    
    UIColor * randomColor = [UIColor colorWithRed:red
                                            green:green
                                             blue:blue
                                            alpha:1.0];
    self.circleColor = randomColor;
}

-(void)drawRect:(CGRect)rect{
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2;
    center.y = bounds.origin.y + bounds.size.height / 2;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2;
    
    UIBezierPath *path = [[UIBezierPath alloc]init];
    path.lineWidth = 10.0;
    [self.circleColor setStroke];

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

- (void)setCircleColor:(UIColor *)circleColor{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}
@end
