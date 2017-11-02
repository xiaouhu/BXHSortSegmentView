//
//  NSObject+BXHCategory.h
//  BXHCategory
//
//  Created by 步晓虎 on 2017/9/12.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (BXHCategory)
//类名
+ (NSString *)bxh_className;
//类名
- (NSString *)bxh_className;
//深拷贝
- (nullable id)deepCopy;
//====================swizzle==========================//
//swizzleInstance
+ (BOOL)bxh_swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel;
//swizzleClass
+ (BOOL)bxh_swizzleClassMethod:(SEL)originalSel with:(SEL)newSel;
//====================associate value==================//
//setValueForKey
- (void)bxh_setAssociateValue:(nullable id)value withKey:(void *)key;
//setWeakValueForKey
- (void)bxh_setAssociateWeekValue:(nullable id)weakValue withKey:(void *)key;
//getValueForKey
- (nullable id)bxh_getAssociatedValueForKey:(void *)key;
//removeValueForKey
- (void)bxh_removeAssociatedValues;
@end

NS_ASSUME_NONNULL_END
