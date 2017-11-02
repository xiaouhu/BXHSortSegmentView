//
//  BXHSegmentItem.m
//  SZYLive_Partent
//
//  Created by 步晓虎 on 2017/11/1.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "BXHSegmentItem.h"
#import "UIControl+BXHCategory.h"

NSString *const BXHSegmentItemStateNormalKey = @"BXHSegmentItemStateNormalKey";
NSString *const BXHSegmentItemStateSelectedKey = @"BXHSegmentItemStateSelectedKey";
NSString *const BXHSegmentItemStateUpKey = @"BXHSegmentItemStateUpKey";
NSString *const BXHSegmentItemStateDownKey = @"BXHSegmentItemStateDownKey";

@interface BXHSegmentItem ()

@property (nonatomic, weak) id target;

@property (nonatomic, assign) SEL action;

@end

@implementation BXHSegmentItem
- (instancetype)init
{
    if (self = [super init])
    {
        self.backgroundColor = [UIColor whiteColor];
        __weak typeof(self) weakSelf = self;
        [self bxh_addBlockForControlEvents:UIControlEventTouchUpInside block:^(id sender) {
            __strong typeof(weakSelf) self = weakSelf;
            if(![self itemActionChangeDealState]) return;
            if (!self.target) return;
            NSMethodSignature *signature = [self.target methodSignatureForSelector:self.action];
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
            [invocation setArgument:&self atIndex:2];
            invocation.selector = self.action;
            [invocation invokeWithTarget:self.target];
        }];
    }
    return self;
}


#pragma mark - public
- (BOOL)itemActionChangeDealState
{
    return NO;
}

- (NSString *)stateKeyFromItemState:(BXHSegmentItemState)state
{
    switch (state) {
        case BXHSegmentItemStateSelected:
        {
            return BXHSegmentItemStateSelectedKey;
        }
            break;
        case BXHSegmentItemStateUp:
        {
            return BXHSegmentItemStateUpKey;
        }
            break;
        case BXHSegmentItemStateDown:
        {
            return BXHSegmentItemStateDownKey;
        }
            break;
            
        default:
        {
            return BXHSegmentItemStateNormalKey;
        }
            break;
    }

}

- (void)addEventForStatedChangedWithTarget:(id)target action:(SEL)action
{
    self.target = target;
    self.action = action;
}

- (void)resetToNormal
{
    
}

- (BOOL)menuChoose
{
    return NO;
}


@end
