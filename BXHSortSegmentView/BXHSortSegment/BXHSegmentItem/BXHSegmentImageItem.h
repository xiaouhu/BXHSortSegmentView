//
//  BXHSegmentImageItem.h
//  SZYLive_Partent
//
//  Created by 步晓虎 on 2017/11/2.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "BXHSegmentItem.h"

@interface BXHSegmentImageItem : BXHSegmentItem // menuChoose默认是YES

@property (nonatomic, strong, readonly) UILabel *titleLabel;

@property (nonatomic, strong, readonly) UIImageView *imageView;

- (void)setTitleColor:(UIColor *)color forState:(BXHSegmentItemState)state;
- (UIColor *)getColorForState:(BXHSegmentItemState)state;

- (void)setImage:(UIImage *)image forState:(BXHSegmentItemState)state;
- (UIImage *)getImageForState:(BXHSegmentItemState)state;

@end
