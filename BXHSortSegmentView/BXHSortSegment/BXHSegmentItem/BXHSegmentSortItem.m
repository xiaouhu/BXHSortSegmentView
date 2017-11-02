//
//  BXHSegmentSortItem.m
//  SZYLive_Partent
//
//  Created by 步晓虎 on 2017/11/2.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "BXHSegmentSortItem.h"

@implementation BXHSegmentSortItem
@synthesize itemState = _itemState;

- (BOOL)itemActionChangeDealState
{
    UIImage *image = nil;
    UIColor *textColor = nil;
    if (self.itemState == BXHSegmentItemStateNormal)
    {
        _itemState = BXHSegmentItemStateDown;
    }
    else if (self.itemState == BXHSegmentItemStateDown)
    {
        _itemState = BXHSegmentItemStateUp;
    }
    else if (self.itemState == BXHSegmentItemStateUp)
    {
        _itemState = BXHSegmentItemStateDown;
    }
    textColor = [self getColorForState:self.itemState];
    image = [self getImageForState:self.itemState];
    self.titleLabel.textColor = textColor ? textColor : [self getColorForState:BXHSegmentItemStateNormal];
    self.imageView.image = image;
    return YES;
}

- (BOOL)menuChoose
{
    return NO;
}

- (BXHSegmentItemState)itemState
{
    return _itemState;
}


@end
