//
//  UIImage+BXHCategory.m
//  BXHCategory
//
//  Created by 步晓虎 on 2017/9/12.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "UIImage+BXHCategory.h"

@implementation UIImage (BXHCategory)


+ (nullable UIImage *)bxh_imageWithColor:(UIColor *)color
{
    return [self bxh_imageWithColor:color size:CGSizeMake(1, 1)];
}

+ (nullable UIImage *)bxh_imageWithColor:(UIColor *)color size:(CGSize)size
{
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (nullable UIImage *)bxh_imageByResizeToSize:(CGSize)size
{
    if (size.width <= 0 || size.height <= 0) return nil;
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}









@end
