//
//  SZYMenuTest.h
//  SZYLive_Partent
//
//  Created by 步晓虎 on 2017/11/1.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "BXHSegmentMenuView.h"

@interface SZYMenuTest : BXHSegmentMenuView  <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end
