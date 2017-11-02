//
//  BXHSegmentMenuView.h
//  SZYLive_Partent
//
//  Created by 步晓虎 on 2017/11/2.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^MenuChooseCallBack)(NSString * _Nullable title);

@interface BXHSegmentMenuView : UIView

- (CGFloat)showHeight;

- (void)menuCloseWithTitle:(NSString *_Nullable)title;
- (void)menuChooseCloseAction:(MenuChooseCallBack _Nonnull )callBack;

@end
