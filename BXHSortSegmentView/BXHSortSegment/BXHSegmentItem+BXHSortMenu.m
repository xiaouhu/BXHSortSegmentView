//
//  BXHSegmentItem+BXHSortMenu.m
//  SZYLive_Partent
//
//  Created by 步晓虎 on 2017/11/1.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "BXHSegmentItem+BXHSortMenu.h"
#import "NSObject+BXHCategory.h"

static int keyMenu;

@implementation BXHSegmentItem (BXHSortMenu)

- (BOOL)bindMenu:(BXHSegmentMenuView *)menu
{    
    [self bxh_setAssociateValue:menu withKey:&keyMenu];
    __weak typeof(self) weakSelf = self;
    [menu menuChooseCloseAction:^(NSString * _Nullable title) {
        __weak typeof(self) self = weakSelf;
        [self resetToNormal];
        if (!title) return;
        UILabel *titleLabel = [self valueForKey:@"titleLabel"];
        if (!titleLabel) return;
        titleLabel.text = title;
    }];
    return YES;
}

- (BXHSegmentMenuView *)menu
{
    return [self bxh_getAssociatedValueForKey:&keyMenu];
}


@end
