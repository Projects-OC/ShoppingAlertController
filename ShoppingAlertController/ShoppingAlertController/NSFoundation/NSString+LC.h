//
//  NSString+LC.h
//  LCTechnology
//
//  Created by Mac on 2018/4/18.
//  Copyright © 2018年 lc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LC)


/**
 计算字符串 宽度
 */
- (CGFloat)widthWithFont:(UIFont *)font
       constrainedToSize:(CGSize)size;

@end
