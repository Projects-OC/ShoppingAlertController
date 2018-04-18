//
//  LCShoppingPresentFooterView.m
//  LCTechnology
//
//  Created by Mac on 2018/4/13.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCShoppingPresentFooterView.h"
#import "LCShoppingCountChangeView.h"
#import "UIBezierPath+LC.h"

@interface LCShoppingPresentFooterView ()
{
    LCShoppingCountChangeView *_cotView;
}
@end

@implementation LCShoppingPresentFooterView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.textColor = LCBlackColor;
        _titleLb.text = @"数量";
        _titleLb.font = LCFont(13);
        _titleLb.lineBreakMode = NSLineBreakByTruncatingTail;
        [self addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.centerY.equalTo(self);
        }];
        
        _cotView = [[LCShoppingCountChangeView alloc] init];
        [self addSubview:_cotView];
        [_cotView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.right.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(120, 40));
        }];
        _cotView.shopingCountBlock = ^(NSInteger shoppingCount) {
            
        };
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
