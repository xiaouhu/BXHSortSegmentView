//
//  ViewController.m
//  BXHSortSegmentView
//
//  Created by 步晓虎 on 2017/11/2.
//  Copyright © 2017年 步晓虎. All rights reserved.
//

#import "ViewController.h"
#import "BXHSortSegment.h"
#import "UIImage+BXHCategory.h"
#import "SZYMenuTest.h"

@interface ViewController ()

@property (nonatomic, strong) BXHSortSegmentView *segmentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.segmentView];
    self.segmentView.frame = CGRectMake(0, 80, self.view.bounds.size.width, 44);
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - lazyLoad
- (NSArray <BXHSegmentItem *>*)segmentItems
{
    BXHSegmentTitleItem *item = [[BXHSegmentTitleItem alloc] init];
    [item.titleLabel setText:@"综合"];
    [item setTitleColor:[UIColor redColor] forState:BXHSegmentItemStateSelected];
    
    BXHSegmentImageItem *item0 = [[BXHSegmentImageItem alloc] init];
    [item0.titleLabel setText:@"选择"];
    [item0 setTitleColor:[UIColor redColor] forState:BXHSegmentItemStateSelected];
    [item0 setImage:[UIImage bxh_imageWithColor:[UIColor redColor] size:CGSizeMake(10, 15)] forState:BXHSegmentItemStateNormal];
    [item0 setImage:[UIImage bxh_imageWithColor:[UIColor yellowColor] size:CGSizeMake(10, 15)] forState:BXHSegmentItemStateSelected];
    [item0 bindMenu:[SZYMenuTest new]];
    
    BXHSegmentSortItem *item1 = [[BXHSegmentSortItem alloc] init];
    [item1.titleLabel setText:@"排序"];
    [item1 setTitleColor:[UIColor redColor] forState:BXHSegmentItemStateDown];
    [item1 setTitleColor:[UIColor redColor] forState:BXHSegmentItemStateUp];
    [item1 setImage:[UIImage bxh_imageWithColor:[UIColor redColor] size:CGSizeMake(10, 15)] forState:BXHSegmentItemStateNormal];
    [item1 setImage:[UIImage bxh_imageWithColor:[UIColor brownColor] size:CGSizeMake(10, 15)] forState:BXHSegmentItemStateDown];
    [item1 setImage:[UIImage bxh_imageWithColor:[UIColor blueColor] size:CGSizeMake(10, 15)] forState:BXHSegmentItemStateUp];
    return @[item, item0, item1];
}

- (BXHSortSegmentView *)segmentView
{
    if (!_segmentView)
    {
        _segmentView = [[BXHSortSegmentView alloc] initWithSegmentItems:[self segmentItems]];
        [_segmentView setMenuContentView:[BXHSortMenuShowContentView new]];
    }
    return _segmentView;
}


@end
