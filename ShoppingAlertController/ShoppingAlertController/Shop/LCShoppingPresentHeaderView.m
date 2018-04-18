//
//  LCShoppingPresentHeaderView.m
//  LCTechnology
//
//  Created by Mac on 2018/4/12.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCShoppingPresentHeaderView.h"
#import "UIBezierPath+LC.h"

@implementation LCShoppingPresentHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {        
        _titleLb = [[UILabel alloc] init];
        _titleLb.textColor = LCBlackColor;
        _titleLb.text = @"颜色";
        _titleLb.font = LCFont(13);
        _titleLb.lineBreakMode = NSLineBreakByTruncatingTail;
        [self addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    [UIBezierPath drawLinePoint:CGPointMake(0, 5)
                        toPoint:CGPointMake(LCScreenWidth, 5)
                    strokeColor:LCBGaryColor
                         byView:self];
}

@end
