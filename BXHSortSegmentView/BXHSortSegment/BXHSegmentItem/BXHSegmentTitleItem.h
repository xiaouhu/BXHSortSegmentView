//
//  BXHSegmentTitleItem.h
//  SZYLive_Partent
//
//  Created by 步晓虎 on 2017/11/2.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "BXHSegmentItem.h"

@interface BXHSegmentTitleItem : BXHSegmentItem

@property (nonatomic, strong, readonly) UILabel *titleLabel;

- (void)setTitleColor:(UIColor *)color forState:(BXHSegmentItemState)state;
- (UIColor *)getColorForState:(BXHSegmentItemState)state;

@end
