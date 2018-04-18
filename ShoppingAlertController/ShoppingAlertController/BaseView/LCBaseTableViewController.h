//
//  LCBaseTableViewController.h
//  LCTechnology
//
//  Created by Mac on 2018/4/10.
//  Copyright © 2018年 lc. All rights reserved.
//

#import "LCBaseViewController.h"
#import "LCBaseTableView.h"

@interface LCBaseTableViewController : LCBaseViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,weak)LCBaseTableView *plainTableView;
@property(nonatomic,weak)LCBaseTableView *groupTableView;

@end
