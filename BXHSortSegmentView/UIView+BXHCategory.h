//
//  UIView+BXHCategory.h
//  BXHCategory
//
//  Created by 步晓虎 on 2017/9/13.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface UIView (BXHCategory)

@property (nonatomic, readonly, nullable) UIViewController *viewController;

@property (nonatomic) CGFloat left; //Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top; //Shortcut for frame.origin.y
@property (nonatomic) CGFloat right; //Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom; // Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width; //Shortcut for frame.size.width
@property (nonatomic) CGFloat height; //Shortcut for frame.size.height
@property (nonatomic) CGFloat centerX; //Shortcut for center.x
@property (nonatomic) CGFloat centerY; //Shortcut for center.y
@property (nonatomic) CGPoint origin; //Shortcut for frame.origin
@property (nonatomic) CGSize size; //Shortcut for frame.size

//初始化从bundle
+ (instancetype)bxh_awkeFromXibInBundle:(NSBundle *)bundle;
//初始化从mianBundle
+ (instancetype)bxh_awkeFromXibInMainBundle;
//截图
- (nullable UIImage *)bxh_snapshotImage;
//截图是否是更新Screen之后
- (nullable UIImage *)bxh_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;
//截图生成pdf
- (nullable NSData *)bxh_snapsshotPDF;
//设置阴影
- (void)bxh_setLayerShadow:(UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;
//删除所有的subViews
- (void)bxh_removeAllSubViews;

- (void)bxh_shakeViewHorizontal;



@end
NS_ASSUME_NONNULL_END
