//
//  BXHSortSegmentView.h
//  SZYLive_Partent
//
//  Created by 步晓虎 on 2017/11/1.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BXHSegmentItem.h"
#import "BXHSortMenuShowContentView.h"

#define kLineWidth 1

@class BXHSortSegmentView;
@protocol BXHSortSegmentViewDelegate <NSObject>

- (void)segmentView:(BXHSortSegmentView *)segmentView selectItem:(BXHSegmentItem *)item;

@end

@interface BXHSortSegmentView : UIView

- (instancetype)initWithSegmentItems:(NSArray <BXHSegmentItem *>*)items;
@property (nonatomic, strong, readonly) NSArray *items;

- (void)setMenuContentView:(BXHSortMenuShowContentView *)menuView;
@property (nonatomic, strong, readonly) BXHSortMenuShowContentView *menuView;

- (void)selectItemAtIndex:(NSInteger)index;

@property (nonatomic, weak) id <BXHSortSegmentViewDelegate>delegate;

@end
