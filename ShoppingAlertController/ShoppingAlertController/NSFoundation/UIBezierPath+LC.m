//
//  UIBezierPath+LC.m
//  LCTechnology
//
//  Created by Mac on 2018/4/13.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "UIBezierPath+LC.h"

@implementation UIBezierPath (LC)

+ (void)drawRoundCornersSize:(CGSize)cornersSize
           byRoundingCorners:(UIRectCorner)byRoundingCorners
                      byView:(UIView *)byView{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:byView.bounds
                                                   byRoundingCorners:byRoundingCorners
                                                         cornerRadii:cornersSize];
   
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = byView.bounds;
    maskLayer.path = maskPath.CGPath;
    byView.layer.mask = maskLayer;
}

+ (void)drawLinePoint:(CGPoint)point
              toPoint:(CGPoint)toPint
          strokeColor:(UIColor *)strokeColor
               byView:(UIView *)byView{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:point];
    [path addLineToPoint:toPint];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.lineWidth = 0.5f;
    layer.strokeColor = strokeColor.CGColor;
    layer.path = path.CGPath;
    layer.fillColor = nil;
    [byView.layer addSublayer:layer];
}

@end
