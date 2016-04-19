//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Roman Ustiantcev on 19/04/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

-(void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    // figure out the center of bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // the largest circle
    float maxRadius = hypot(bounds.size.width, bounds.size.height)/ 2.0;
    
    // draw line with UIBezierPath
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20){
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI * 2 clockwise:YES];
    }
    
    // configure the line width
    path.lineWidth = 10;
    
    // configure the drawing color
    [[UIColor lightGrayColor] setStroke];
    
    // draw line
    [path stroke];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self){
        // all HypnosisViews start with clear color
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


@end
