//
//  LCShoppingPresentTopView.m
//  LCTechnology
//
//  Created by Mac on 2018/4/12.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCShoppingPresentTopView.h"
#import "LCShoppingModel.h"

@implementation LCShoppingPresentTopView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat padding = 10.0;

        //图片
        _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Expression04"]];
        [self addSubview:_imgView];
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.mas_equalTo(padding);
            make.width.height.mas_equalTo(80);
        }];
        
        //标题
        _titleLb = [[UILabel alloc] init];
        _titleLb.textColor = LCBlackColor;
        _titleLb.text = @"商品标题";
        _titleLb.font = LCFont(15);
        [self addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_imgView.mas_right).offset(padding);
            make.top.mas_equalTo(padding);
        }];
        
        //标题
        _detailLb = [[UILabel alloc] init];
        _detailLb.textColor = LCBlackColor;
        _detailLb.text = @"商品标题";
        _detailLb.font = LCFont(15);
        [self addSubview:_detailLb];
        [_detailLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_imgView.mas_right).offset(padding);
            make.bottom.equalTo(_imgView.mas_bottom);
        }];
    }
    return self;
}

- (void)setModel:(LCShoppingModel *)model{
    _imgView.image = [UIImage imageNamed:model.url];
    _titleLb.text = model.title;
    _detailLb.text = model.code;
}

@end
