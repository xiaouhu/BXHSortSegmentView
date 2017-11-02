//
//  NSObject+BXHCategory.m
//  BXHCategory
//
//  Created by 步晓虎 on 2017/9/12.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "NSObject+BXHCategory.h"
#import <objc/runtime.h>

@implementation NSObject (BXHCategory)

+ (NSString *)bxh_className
{
    return NSStringFromClass(self);
}

- (NSString *)bxh_className
{
    return [NSString stringWithUTF8String:class_getName([self class])];
}

- (nullable id)deepCopy
{
    id obj = nil;
    @try {
        obj = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:self]];
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception);
    }
    return obj;
}

+ (BOOL)bxh_swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel
{
    Method originalMethod = class_getInstanceMethod(self, originalSel);
    Method newMethod = class_getInstanceMethod(self, newSel);
    if (!originalMethod || !newMethod) return NO;
    
    class_addMethod(self,
                    originalSel,
                    class_getMethodImplementation(self, originalSel),
                    method_getTypeEncoding(originalMethod));
    class_addMethod(self,
                    newSel,
                    class_getMethodImplementation(self, newSel),
                    method_getTypeEncoding(newMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(self, originalSel),
                                   class_getInstanceMethod(self, newSel));
    return YES;
}

+ (BOOL)bxh_swizzleClassMethod:(SEL)originalSel with:(SEL)newSel
{
    Class class = object_getClass(self);
    Method originalMethod = class_getInstanceMethod(class, originalSel);
    Method newMethod = class_getInstanceMethod(class, newSel);
    if (!originalMethod || !newMethod) return NO;
    method_exchangeImplementations(originalMethod, newMethod);
    return YES;
}

- (void)bxh_setAssociateValue:(nullable id)value withKey:(void *)key
{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)bxh_setAssociateWeekValue:(nullable id)weakValue withKey:(void *)key
{
    objc_setAssociatedObject(self, key, weakValue, OBJC_ASSOCIATION_ASSIGN);
}

- (nullable id)bxh_getAssociatedValueForKey:(void *)key
{
    return objc_getAssociatedObject(self, key);
}

- (void)bxh_removeAssociatedValues
{
    objc_removeAssociatedObjects(self);
}

@end
