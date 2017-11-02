//
//  BXHSegmentItem.h
//  SZYLive_Partent
//
//  Created by 步晓虎 on 2017/11/1.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BXHSegmentItemState)
{
    BXHSegmentItemStateNormal,
    BXHSegmentItemStateSelected,
    
    BXHSegmentItemStateUp,
    BXHSegmentItemStateDown 
};

UIKIT_EXTERN NSString *const BXHSegmentItemStateNormalKey;
UIKIT_EXTERN NSString *const BXHSegmentItemStateSelectedKey;
UIKIT_EXTERN NSString *const BXHSegmentItemStateUpKey;
UIKIT_EXTERN NSString *const BXHSegmentItemStateDownKey;

@interface BXHSegmentItem : UIControl

@property (nonatomic, assign, readonly) BXHSegmentItemState itemState;
- (NSString *)stateKeyFromItemState:(BXHSegmentItemState)state;

- (BOOL)itemActionChangeDealState; //needOverWrite return needInvke Action

- (void)addEventForStatedChangedWithTarget:(id)target action:(SEL)action; //

- (void)resetToNormal;

- (BOOL)menuChoose;

@end
