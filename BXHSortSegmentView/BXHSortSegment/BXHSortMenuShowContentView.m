//
//  BXHSortMenuShowContentView.m
//  SZYLive_Partent
//
//  Created by 步晓虎 on 2017/11/1.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "BXHSortMenuShowContentView.h"
#import "UIView+BXHCategory.h"

@implementation BXHSortMenuShowContentView

- (instancetype)init
{
    if (self = [super init])
    {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        self.alpha = 0;
        self.hidden = YES;
        self.clipsToBounds = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(contentTap)];
        [self addGestureRecognizer:tap];
    }
    return self;
}


- (void)showMenu:(BXHSegmentMenuView *)menu
{
    if (_currentMenu)
    {
        if (_currentMenu == menu)
        {
            if(self.show)
            {
                [self hiddenMenu];
            }
            else
            {
                [self showMenuAnimate];
            }
        }
        else
        {
            menu.frame = CGRectMake(0, -[menu showHeight], self.bounds.size.width, [menu showHeight]);
            [self menuHiddenAnimteCallBack:^(BOOL finished) {
                [_currentMenu removeFromSuperview];
                _currentMenu = menu;
                [self addSubview:_currentMenu];
                [self showContentMenu];
            }];
        }
    }
    else
    {
        menu.frame = CGRectMake(0, -[menu showHeight], self.bounds.size.width, [menu showHeight]);
        _currentMenu = menu;
        [self addSubview:_currentMenu];
        [self showMenuAnimate];
    }
}

- (BOOL)show
{
    return !self.hidden;
}

#pragma mark - private
- (void)contentTap
{
    [_currentMenu menuCloseWithTitle:nil];
    [self hiddenMenu];
}

- (void)hiddenMenu
{
    [self menuHiddenAnimteCallBack:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            self.hidden = YES;
        }];
    }];
}

- (void)showMenuAnimate
{
    self.hidden = NO;
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        [self showContentMenu];
    }];
}

- (void)showContentMenu
{
    [self menuShowAnimateCallBack:^(BOOL finished) {
        
    }];
}

- (void)menuShowAnimateCallBack:(void (^)(BOOL))complete
{
    [UIView animateWithDuration:0.5 animations:^{
        _currentMenu.top = 0;
    } completion:complete];
}

- (void)menuHiddenAnimteCallBack:(void (^)(BOOL))complete
{
    [UIView animateWithDuration:0.5 animations:^{
        _currentMenu.height = -[_currentMenu showHeight];
    } completion:complete];
}



@end
