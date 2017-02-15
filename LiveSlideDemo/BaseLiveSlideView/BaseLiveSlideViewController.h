//
//  BaseLiveSlideViewController.m
//  BaseLiveDemo
//
//  Created by lisai on 17/2/15.
//  Copyright © 2017年 Sai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseLiveSlideViewController : UIViewController
//其他view都加到这个上面，以便于跟着手势移动！
@property (nonatomic, strong) UIView *panView;///<承载slidingPanelView和播放视图
@property (nonatomic, strong) UIView *slidingPanelView;///<放置动画，礼物按钮等等视图，右划移除。
///滑动的时候要切换背景
- (void)nextViewWillAppear;

- (void)prevViewWillAppear;

- (void)nextViewDidAppear;

- (void)prevViewDidAppear;
@end
