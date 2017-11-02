//
//  SZYMenuTest.m
//  SZYLive_Partent
//
//  Created by 步晓虎 on 2017/11/1.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "SZYMenuTest.h"
@interface SZYMenuTest ()

@property (nonatomic, copy) MenuChooseCallBack callBack;

@end

@implementation SZYMenuTest

- (instancetype)init
{
    if (self = [super init])
    {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.tableView];
    }
    return self;
}

- (void)layoutSubviews
{
    self.tableView.frame = self.bounds;
    [super layoutSubviews];
}

#pragma mark - delegate / dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    [self menuCloseWithTitle:@"asda"];
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
    }
    return _tableView;
}
@end
