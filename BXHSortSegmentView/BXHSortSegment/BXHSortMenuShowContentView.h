//
//  BXHSortMenuShowContentView.h
//  SZYLive_Partent
//
//  Created by 步晓虎 on 2017/11/1.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BXHSegmentMenuView.h"

@interface BXHSortMenuShowContentView : UIView

@property (nonatomic, assign, readonly) BOOL show;

@property (nonatomic, weak) BXHSegmentMenuView *currentMenu;

- (void)showMenu:(BXHSegmentMenuView *)menu;

- (void)hiddenMenu;

@end
