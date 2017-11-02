//
//  BXHSegmentTitleItem.m
//  SZYLive_Partent
//
//  Created by 步晓虎 on 2017/11/2.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "BXHSegmentTitleItem.h"
#import "Masonry.h"

@interface BXHSegmentTitleItem ()
{
    UILabel *_titleLabel;
}
@property (nonatomic, strong) NSMutableDictionary *colorMap;

@end


@implementation BXHSegmentTitleItem
@synthesize itemState = _itemState;

- (instancetype)init
{
    if (self = [super init])
    {
        self.colorMap = [NSMutableDictionary dictionary];
        [self setTitleColor:[UIColor darkTextColor] forState:BXHSegmentItemStateNormal];
        
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self);
        }];
    }
    return self;
}

- (BOOL)itemActionChangeDealState
{
    if (self.itemState == BXHSegmentItemStateSelected) return NO;
    _itemState = BXHSegmentItemStateSelected;
    UIColor *textColor = self.colorMap[BXHSegmentItemStateSelectedKey];
    if(textColor)
    {
        self.titleLabel.textColor = textColor;
    }
    return YES;
}

- (void)resetToNormal
{
    if (self.itemState == BXHSegmentItemStateNormal) return;
    _itemState = BXHSegmentItemStateNormal;
    self.titleLabel.textColor = self.colorMap[BXHSegmentItemStateNormalKey];
}

#pragma mark - public
- (void)setTitleColor:(UIColor *)color forState:(BXHSegmentItemState)state
{
    if(!color) return;
    NSString *key = [self stateKeyFromItemState:state];
    self.colorMap[key] = color;
    if (state == self.itemState) self.titleLabel.textColor = color;
}

- (UIColor *)getColorForState:(BXHSegmentItemState)state
{
    NSString *key = [self stateKeyFromItemState:state];
    return self.colorMap[key];
}

#pragma mark - lazyLoad
- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titleLabel;
}

- (BXHSegmentItemState)itemState
{
    return _itemState;
}
@end
