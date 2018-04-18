//
//  ViewController.m
//  ShoppingAlertController
//
//  Created by Mac on 2018/4/18.
//  Copyright © 2018年 MF. All rights reserved.
//

#import "ViewController.h"
#import "LCShoppingPresentViewController.h"
#import "LCPresentationController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *_lb = [UILabel new];
    _lb.textAlignment = NSTextAlignmentCenter;
    _lb.text = @"点击屏幕";
    [self.view addSubview:_lb];
    [_lb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    LCShoppingPresentViewController *presentVc = [[LCShoppingPresentViewController alloc] init];
    LCPresentationController *presentationController NS_VALID_UNTIL_END_OF_SCOPE;
    presentationController = [[LCPresentationController alloc] initWithPresentedViewController:presentVc
                                                                      presentingViewController:self];
    presentVc.transitioningDelegate = presentationController;
    [self presentViewController:presentVc animated:YES completion:NULL];
}


@end
