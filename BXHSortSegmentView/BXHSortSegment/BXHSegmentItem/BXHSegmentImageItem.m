//
//  BXHSegmentImageItem.m
//  SZYLive_Partent
//
//  Created by 步晓虎 on 2017/11/2.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "BXHSegmentImageItem.h"
#import "Masonry.h"

@interface BXHSegmentImageItem ()
{
    UILabel *_titleLabel;
    UIImageView *_imageView;
}

@property (nonatomic, strong) NSMutableDictionary *imageMap;
@property (nonatomic, strong) NSMutableDictionary *colorMap;


@end


@implementation BXHSegmentImageItem
@synthesize itemState = _itemState;

- (instancetype)init
{
    if (self = [super init])
    {
        
        self.imageMap = [NSMutableDictionary new];
        self.colorMap = [NSMutableDictionary new];
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.imageView];
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.centerX.mas_equalTo(self).offset(-5);
        }];
        
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.left.mas_equalTo(self.titleLabel.mas_right).offset(2);
        }];
    }
    return self;
}

- (BOOL)itemActionChangeDealState
{
    UIImage *image = nil;
    UIColor *textColor = nil;
    
    if (self.itemState == BXHSegmentItemStateNormal)
    {
        _itemState = BXHSegmentItemStateSelected;
        
    }
    else if (self.itemState == BXHSegmentItemStateSelected)
    {
        _itemState = BXHSegmentItemStateNormal;
    }
    NSString *key = [self stateKeyFromItemState:self.itemState];
    textColor = self.colorMap[key];
    image = self.imageMap[key];
    self.titleLabel.textColor = textColor ? textColor : self.colorMap[BXHSegmentItemStateNormalKey];
    self.imageView.image = image;
    return YES;
}

- (void)resetToNormal
{
    if (self.itemState == BXHSegmentItemStateNormal) return;
    _itemState = BXHSegmentItemStateNormal;
    self.titleLabel.textColor = self.colorMap[BXHSegmentItemStateNormalKey];
    self.imageView.image = self.imageMap[BXHSegmentItemStateNormalKey];
}

- (BOOL)menuChoose
{
    return YES;
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

- (void)setImage:(UIImage *)image forState:(BXHSegmentItemState)state
{
    NSString *key = [self stateKeyFromItemState:state];
    [self.imageMap setObject:image forKey:key];
    
    if (self.itemState == state)
    {
        self.imageView.image = image;
    }
}

- (UIImage *)getImageForState:(BXHSegmentItemState)state
{
    NSString *key = [self stateKeyFromItemState:state];
    return self.imageMap[key];
}


#pragma mark - lazyLoad
- (UIImageView *)imageView
{
    if (!_imageView)
    {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

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

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
