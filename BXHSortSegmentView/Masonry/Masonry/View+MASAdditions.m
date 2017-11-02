//
//  UIView+MASAdditions.m
//  Masonry
//
//  Created by Jonas Budelmann on 20/07/13.
//  Copyright (c) 2013 cloudling. All rights reserved.
//

#import "View+MASAdditions.h"
#import <objc/runtime.h>

@implementation MAS_VIEW (MASAdditions)

- (NSArray *)mas_makeConstraints:(void(^)(MASConstraintMaker *))block {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    MASConstraintMaker *constraintMaker = [[MASConstraintMaker alloc] initWithView:self];
    block(constraintMaker);
    return [constraintMaker install];
}

- (NSArray *)mas_updateConstraints:(void(^)(MASConstraintMaker *))block {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    MASConstraintMaker *constraintMaker = [[MASConstraintMaker alloc] initWithView:self];
    constraintMaker.updateExisting = YES;
    block(constraintMaker);
    return [constraintMaker install];
}

- (NSArray *)mas_remakeConstraints:(void(^)(MASConstraintMaker *make))block {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    MASConstraintMaker *constraintMaker = [[MASConstraintMaker alloc] initWithView:self];
    constraintMaker.removeExisting = YES;
    block(constraintMaker);
    return [constraintMaker install];
}

#pragma mark - NSLayoutAttribute properties

- (MASViewAttribute *)mas_left {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeLeft];
}

- (MASViewAttribute *)mas_top {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeTop];
}

- (MASViewAttribute *)mas_right {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeRight];
}

- (MASViewAttribute *)mas_bottom {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeBottom];
}

- (MASViewAttribute *)mas_leading {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeLeading];
}

- (MASViewAttribute *)mas_trailing {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeTrailing];
}

- (MASViewAttribute *)mas_width {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeWidth];
}

- (MASViewAttribute *)mas_height {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeHeight];
}

- (MASViewAttribute *)mas_centerX {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeCenterX];
}

- (MASViewAttribute *)mas_centerY {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeCenterY];
}

- (MASViewAttribute *)mas_baseline {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeBaseline];
}

- (MASViewAttribute *(^)(NSLayoutAttribute))mas_attribute
{
    return ^(NSLayoutAttribute attr) {
        return [[MASViewAttribute alloc] initWithView:self layoutAttribute:attr];
    };
}

- (MASViewAttribute *)mas_firstBaseline {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeFirstBaseline];
}
- (MASViewAttribute *)mas_lastBaseline {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeLastBaseline];
}

#if TARGET_OS_IPHONE || TARGET_OS_TV

- (MASViewAttribute *)mas_leftMargin {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeLeftMargin];
}

- (MASViewAttribute *)mas_rightMargin {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeRightMargin];
}

- (MASViewAttribute *)mas_topMargin {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeTopMargin];
}

- (MASViewAttribute *)mas_bottomMargin {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeBottomMargin];
}

- (MASViewAttribute *)mas_leadingMargin {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeLeadingMargin];
}

- (MASViewAttribute *)mas_trailingMargin {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeTrailingMargin];
}

- (MASViewAttribute *)mas_centerXWithinMargins {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeCenterXWithinMargins];
}

- (MASViewAttribute *)mas_centerYWithinMargins {
    return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeCenterYWithinMargins];
}

- (MASViewAttribute *)mas_safeAreaLayoutGuide {
    return [[MASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeNotAnAttribute];
}

- (id)bxh_SafeAreaLayoutGuide
{
    if (@available(iOS 11.0, *))
    {
        return self.mas_safeAreaLayoutGuide;
    }
    else
    {
        return self;
    }
}

- (MASViewAttribute *)mas_safeAreaLayoutGuideLeading {
    return [[MASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeLeading];
}

- (MASViewAttribute *)bxh_safeAreaLayoutGuideLeading
{
    if (@available(iOS 11.0, *))
    {
        return self.mas_safeAreaLayoutGuideLeading;
    }
    else
    {
        return self.mas_leading;
    }
}

- (MASViewAttribute *)mas_safeAreaLayoutGuideTrailing {
    return [[MASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeTrailing];
}

- (MASViewAttribute *)bxh_safeAreaLayoutGuideTrailing
{
    if (@available(iOS 11.0, *))
    {
        return self.mas_safeAreaLayoutGuideTrailing;
    }
    else
    {
        return self.mas_trailing;
    }
}

- (MASViewAttribute *)mas_safeAreaLayoutGuideLeft {
    return [[MASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeLeft];
}

- (MASViewAttribute *)bxh_safeAreaLayoutGuideLeft
{
    if (@available(iOS 11.0, *))
    {
        return self.mas_safeAreaLayoutGuideLeft;
    }
    else
    {
        return self.mas_left;
    }
}

- (MASViewAttribute *)mas_safeAreaLayoutGuideRight {
    return [[MASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeRight];
}

- (MASViewAttribute *)bxh_safeAreaLayoutGuideRight
{
    if (@available(iOS 11.0, *))
    {
        return self.mas_safeAreaLayoutGuideRight;
    }
    else
    {
        return self.mas_right;
    }
}

- (MASViewAttribute *)mas_safeAreaLayoutGuideTop {
    return [[MASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeTop];
}

- (MASViewAttribute *)bxh_safeAreaLayoutGuideTop
{
    if (@available(iOS 11.0, *))
    {
        return self.mas_safeAreaLayoutGuideTop;
    }
    else
    {
        return self.mas_top;
    }
}

- (MASViewAttribute *)mas_safeAreaLayoutGuideBottom {
    return [[MASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeBottom];
}

- (MASViewAttribute *)bxh_safeAreaLayoutGuideBottom
{
    if (@available(iOS 11.0, *))
    {
        return self.mas_safeAreaLayoutGuideBottom;
    }
    else
    {
        return self.mas_bottom;
    }
}

- (MASViewAttribute *)mas_safeAreaLayoutGuideWidth {
    return [[MASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeWidth];
}

- (MASViewAttribute *)bxh_safeAreaLayoutGuideWidth
{
    if (@available(iOS 11.0, *))
    {
        return self.mas_safeAreaLayoutGuideWidth;
    }
    else
    {
        return self.mas_width;
    }
}

- (MASViewAttribute *)mas_safeAreaLayoutGuideHeight {
    return [[MASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeHeight];
}

- (MASViewAttribute *)bxh_safeAreaLayoutGuideHeight
{
    if (@available(iOS 11.0, *))
    {
        return self.mas_safeAreaLayoutGuideHeight;
    }
    else
    {
        return self.mas_height;
    }
}

- (MASViewAttribute *)mas_safeAreaLayoutGuideCenterX {
    return [[MASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeCenterX];
}

- (MASViewAttribute *)bxh_safeAreaLayoutGuideCenterX
{
    if (@available(iOS 11.0, *))
    {
        return self.mas_safeAreaLayoutGuideCenterX;
    }
    else
    {
        return self.mas_centerX;
    }
}

- (MASViewAttribute *)mas_safeAreaLayoutGuideCenterY {
    return [[MASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeCenterY];
}

- (MASViewAttribute *)bxh_safeAreaLayoutGuideCenterY
{
    if (@available(iOS 11.0, *))
    {
        return self.mas_safeAreaLayoutGuideCenterY;
    }
    else
    {
        return self.mas_centerY;
    }
}

#endif

#pragma mark - associated properties

- (id)mas_key {
    return objc_getAssociatedObject(self, @selector(mas_key));
}

- (void)setMas_key:(id)key {
    objc_setAssociatedObject(self, @selector(mas_key), key, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - heirachy

- (instancetype)mas_closestCommonSuperview:(MAS_VIEW *)view {
    MAS_VIEW *closestCommonSuperview = nil;

    MAS_VIEW *secondViewSuperview = view;
    while (!closestCommonSuperview && secondViewSuperview) {
        MAS_VIEW *firstViewSuperview = self;
        while (!closestCommonSuperview && firstViewSuperview) {
            if (secondViewSuperview == firstViewSuperview) {
                closestCommonSuperview = secondViewSuperview;
            }
            firstViewSuperview = firstViewSuperview.superview;
        }
        secondViewSuperview = secondViewSuperview.superview;
    }
    return closestCommonSuperview;
}

@end
