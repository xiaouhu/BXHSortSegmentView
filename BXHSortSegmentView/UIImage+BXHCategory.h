//
//  UIImage+BXHCategory.h
//  BXHCategory
//
//  Created by 步晓虎 on 2017/9/12.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (BXHCategory)

//创建image根据颜色
+ (nullable UIImage *)bxh_imageWithColor:(UIColor *)color;
//创建image根据颜色和size
+ (nullable UIImage *)bxh_imageWithColor:(UIColor *)color size:(CGSize)size;
//缩小图片到某一个size
- (nullable UIImage *)bxh_imageByResizeToSize:(CGSize)size;
//缩小图片到某一个人size和contentModel
- (nullable UIImage *)bxh_imageByResizeToSize:(CGSize)size contentMode:(UIViewContentMode)contentModel;
//截取图片的某一个部分
- (nullable UIImage *)bxh_imageByCropToRect:(CGRect)rect;
//设置圆角
- (nullable UIImage *)bxh_imageByRoundCornerRadius:(CGFloat)radius;
//设置圆角  borderWidth  borderColor
- (nullable UIImage *)bxh_imageByRoundCornerRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(nullable UIColor *)borderColor;
//旋转图片
- (nullable UIImage *)bxh_imageByRotate:(CGFloat)radians fitSize:(BOOL)fitSize;
//左旋90度
- (nullable UIImage *)bxh_imageByRotateLeft90;
//右旋90度
- (nullable UIImage *)bxh_imageByRotateRight90;
//旋转180
- (nullable UIImage *)bxh_imageByRotate180;
//竖向翻转
- (nullable UIImage *)bxh_imageByFlipVertical;
//横向翻转
- (nullable UIImage *)bxh_imageByFlipHorizontal;


@end

NS_ASSUME_NONNULL_END
