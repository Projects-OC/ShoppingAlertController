//
//  UIBezierPath+LC.h
//  LCTechnology
//
//  Created by Mac on 2018/4/13.
//  Copyright © 2018年 lc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (LC)


/**
 绘圆角

 @param cornersSize 圆角size
 @param byRoundingCorners 圆角位置
 @param byView 绘制视图
 */
+ (void)drawRoundCornersSize:(CGSize)cornersSize
           byRoundingCorners:(UIRectCorner)byRoundingCorners
                      byView:(UIView *)byView;


/**
 绘线

 @param point 开始位置
 @param toPint 截止位置
 @param strokeColor 线条颜色
 @param byView 绘线视图
 */
+ (void)drawLinePoint:(CGPoint)point
              toPoint:(CGPoint)toPint
          strokeColor:(UIColor *)strokeColor
               byView:(UIView *)byView;

@end
