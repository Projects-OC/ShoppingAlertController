//
//  LCBaseTableViewController.m
//  LCTechnology
//
//  Created by Mac on 2018/4/10.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCBaseTableViewController.h"

@interface LCBaseTableViewController ()

@end

@implementation LCBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(LCBaseTableView *)plainTableView{
    if (!_plainTableView) {
        LCBaseTableView *tableView = [[LCBaseTableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectZero];
        tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        tableView.separatorInset = UIEdgeInsetsZero;
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        _plainTableView = tableView;
//        [_plainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.insets(UIEdgeInsetsZero);
//        }];
    }
    return _plainTableView;
}
-(LCBaseTableView *)groupTableView{
    if (!_groupTableView) {
        LCBaseTableView *groupView = [[LCBaseTableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        groupView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectZero];
        groupView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        //groupView.contentInset = UIEdgeInsetsMake(-34, 0, 0, 0);
        groupView.separatorInset = UIEdgeInsetsZero;
        groupView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        groupView.delegate = self;
        groupView.dataSource = self;
        [self.view addSubview:groupView];
        _groupTableView = groupView;
    }
    return _groupTableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
    [self.view endEditing:YES];
}

@end
