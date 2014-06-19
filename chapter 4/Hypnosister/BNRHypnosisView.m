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
    [self drawShadows:bounds];
    [self drawGradient];
}
-(void)drawShadows:(CGRect)bounds{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    //------Los elementos que agregue aqui, apareceran con sombra
    CGContextSetShadow(currentContext, CGSizeMake(4, 7), 3);
    UIImage *logo = [UIImage imageNamed:@"logo"];
    CGRect logoBounds = CGRectMake(50, 100, bounds.size.width - 100, bounds.size.height - 200);
    [logo drawInRect:logoBounds];
    CGContextRestoreGState(currentContext);
}
-(void)drawGradient{
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    CGFloat locations[2]  = {0.0, 1.0};
    CGFloat components[8] = {1.0, 0.0, 0.0, 1.0,
                             1.0, 1.0, 0.0, 1.0};
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient     = CGGradientCreateWithColorComponents(colorspace, components, locations, 2);
    CGPoint startPoint = CGPointMake(40, 40);
    CGPoint endPoint   = CGPointMake(100, 100);
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    
    CGContextRestoreGState(currentContext);
    
}
@end
