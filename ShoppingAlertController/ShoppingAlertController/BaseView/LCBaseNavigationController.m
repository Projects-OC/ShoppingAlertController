//
//  LCBaseNavigationController.m
//  LCTechnology
//
//  Created by Mac on 2018/4/11.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCBaseNavigationController.h"
//#import "UIBarButtonItem+LC.h"

@interface LCBaseNavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation LCBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationBar.translucent = YES;
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = LCBlueColor;
    bar.tintColor = [UIColor whiteColor];
    bar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]){
        self.interactivePopGestureRecognizer.delegate = self;
        self.delegate = self;
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [viewController.navigationController.navigationBar setBackIndicatorImage:[UIImage imageNamed:@"icon_return"]];
    [viewController.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"icon_return"]];
    [viewController.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:[UIColor whiteColor]]];
    if (self.childViewControllers.count > 0) {
//        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"icon_return" withName:@"" target:self action:@selector(cmdBack)];
    }

    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated{
    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

-(void)cmdBack{
    [self popViewControllerAnimated:YES];
}



@end
