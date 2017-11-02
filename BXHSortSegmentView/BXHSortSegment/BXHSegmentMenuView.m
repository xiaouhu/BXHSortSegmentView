//
//  BXHSegmentMenuView.m
//  SZYLive_Partent
//
//  Created by 步晓虎 on 2017/11/2.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "BXHSegmentMenuView.h"
#import "BXHSortMenuShowContentView.h"

@interface BXHSegmentMenuView ()

@property (nonatomic, copy) MenuChooseCallBack callBack;

@end

@implementation BXHSegmentMenuView

- (CGFloat)showHeight
{
    return 300;
}

- (void)menuCloseWithTitle:(NSString *)title
{
    self.callBack(title);
    if(self.superview)
    {
        [(BXHSortMenuShowContentView *)self.superview hiddenMenu];
    }
}

- (void)menuChooseCloseAction:(MenuChooseCallBack)callBack
{
    self.callBack = callBack;
}

@end
