//
//  BXHSegmentItem+BXHSortMenu.h
//  SZYLive_Partent
//
//  Created by 步晓虎 on 2017/11/1.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "BXHSegmentItem.h"
#import "BXHSegmentMenuView.h"

@interface BXHSegmentItem (BXHSortMenu)

@property (nonatomic, strong, readonly) BXHSegmentMenuView *menu;

- (BOOL)bindMenu:(BXHSegmentMenuView *)menu;

@end
