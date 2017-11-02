//
//  UIControl+BXHCategory.m
//  BXHCategory
//
//  Created by 步晓虎 on 2017/9/13.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "UIControl+BXHCategory.h"
#import <objc/runtime.h>

static const int block_key;

@interface  BXHUIControlBlockTarget : NSObject

@property (nonatomic, copy) void (^block)(id sender);

@property (nonatomic, assign) UIControlEvents events;

- (instancetype)initWithBlock:(void (^)(id sender))block events:(UIControlEvents)events;

- (void)invoke:(id)sender;

@end

@implementation BXHUIControlBlockTarget

- (instancetype)initWithBlock:(void (^)(id))block events:(UIControlEvents)events
{
    if (self = [super init])
    {
        _block = block;
        _events = events;
    }
    return self;
}

- (void)invoke:(id)sender
{
    if (_block) _block(sender);
}

@end

@implementation UIControl (BXHCategory)

- (void)bxh_removeAllTargets
{
   [[self allTargets] enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
       [self removeTarget:obj action:NULL forControlEvents:UIControlEventAllEvents];
   }];
   [[self bxh_allUIControlBlockTargets] removeAllObjects];
}

- (void)bxh_addBlockForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id))block
{
    if (!controlEvents) return;
    BXHUIControlBlockTarget *target = [[BXHUIControlBlockTarget alloc] initWithBlock:block events:controlEvents];
    [self addTarget:target action:@selector(invoke:) forControlEvents:controlEvents];
    [[self bxh_allUIControlBlockTargets] addObject:target];
}

- (NSMutableArray *)bxh_allUIControlBlockTargets
{
    NSMutableArray *targets = objc_getAssociatedObject(self, &block_key);
    if (!targets)
    {
        targets = [NSMutableArray array];
        objc_setAssociatedObject(self, &block_key, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}


@end
