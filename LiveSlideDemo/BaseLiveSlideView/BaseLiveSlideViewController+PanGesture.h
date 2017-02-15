//
//  BaseLiveSlideViewController+PanGesture.h
//  BaseLiveDemo
//
//  Created by lisai on 17/2/15.
//  Copyright © 2017年 Sai. All rights reserved.
//

#import "BaseLiveSlideViewController.h"
typedef NS_ENUM(NSUInteger, GFPanGestureDirection) {
    GFPanGestureDirectionUnKnown,
    GFPanGestureDirectionLeft,
    GFPanGestureDirectionRight,
    GFPanGestureDirectionUp,
    GFPanGestureDirectionDown
};
@interface BaseLiveSlideViewController (PanGesture)

- (void)panedView:(UIPanGestureRecognizer *)pan;

@end
