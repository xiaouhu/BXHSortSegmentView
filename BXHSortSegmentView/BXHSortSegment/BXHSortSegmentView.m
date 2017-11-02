//
//  BXHSortSegmentView.m
//  SZYLive_Partent
//
//  Created by 步晓虎 on 2017/11/1.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "BXHSortSegmentView.h"
#import "BXHSegmentItem+BXHSortMenu.h"
#import "UIView+BXHCategory.h"
#import "Masonry.h"

@implementation BXHSortSegmentView

- (instancetype)initWithSegmentItems:(NSArray<BXHSegmentItem *> *)items
{
    if (self = [super init])
    {
        self.backgroundColor = [UIColor lightGrayColor];
        _items = [NSArray arrayWithArray:items];
        for (BXHSegmentItem *item in _items)
        {
            [item addEventForStatedChangedWithTarget:self action:@selector(itemStateChanged:)];
            [self addSubview:item];
        }
    }
    return self;
}

- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
    if (_menuView)
    {
        [self.superview addSubview:_menuView];
        [_menuView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_bottom);
            make.left.mas_equalTo(self.superview);
            make.right.mas_equalTo(self.superview);
            make.bottom.mas_equalTo(self.superview);
        }];

    }
}


- (void)layoutSubviews
{
    CGFloat itemWidth = (self.bounds.size.width - (_items.count - 1) * kLineWidth) / _items.count;
    for (int i = 0; i < _items.count; i ++)
    {
        BXHSegmentItem *item = _items[i];
        item.frame = CGRectMake(i * (itemWidth + kLineWidth), kLineWidth, itemWidth, self.bounds.size.height - kLineWidth * 2);
    }
    [super layoutSubviews];
}

- (void)selectItemAtIndex:(NSInteger)index
{
    if (index >= _items.count) return;
    BXHSegmentItem *item = _items[index];
    [item sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)itemStateChanged:(BXHSegmentItem *)item
{
    if (![item menuChoose])
    {
        for (BXHSegmentItem *sItem in _items)
        {
            if (item != sItem)
            {
                [sItem resetToNormal];
            }
        }
        if(_menuView && _menuView.show)
        {
            [_menuView hiddenMenu];
        }
        if (self.delegate)
        {
            [self.delegate segmentView:self selectItem:item];
        }
    }
    else
    {
        if (_menuView && item.menu)
        {
            [_menuView showMenu:item.menu];
        }
    }
}

#pragma mark - set
- (void)setMenuContentView:(BXHSortMenuShowContentView *)menuView
{
    _menuView = menuView;
    if (self.superview)
    {
        [self.superview addSubview:_menuView];
        [_menuView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_bottom);
            make.left.mas_equalTo(self.superview);
            make.right.mas_equalTo(self.superview);
            make.bottom.mas_equalTo(self.superview);
        }];
    }
}
@end
