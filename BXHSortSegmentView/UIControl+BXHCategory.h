//
//  UIControl+BXHCategory.h
//  BXHCategory
//
//  Created by 步晓虎 on 2017/9/13.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (BXHCategory)

//删除所有的target
- (void)bxh_removeAllTargets;

//添加action
- (void)bxh_addBlockForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id))block;

@end
