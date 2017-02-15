//
//  BaseLiveSlideViewController+PanGesture.m
//  BaseLiveDemo
//
//  Created by lisai on 17/2/15.
//  Copyright © 2017年 Sai. All rights reserved.
//

#import "BaseLiveSlideViewController+PanGesture.h"
#import "UIView+YYAdd.h"
@implementation BaseLiveSlideViewController (PanGesture)
- (void)panedView:(UIPanGestureRecognizer *)pan
{
    static CGPoint benginPanPoint;
    static CGFloat panViewY;
    static CGFloat panViewX;
    static GFPanGestureDirection panDirection;
    
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        {
            benginPanPoint = [pan locationInView:self.view.window];
            panViewY = self.panView.top;
            panViewX = self.slidingPanelView.left;
            panDirection = GFPanGestureDirectionUnKnown;
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            if(GFPanGestureDirectionUnKnown == panDirection){
                
                CGPoint translation =  [pan translationInView:self.view.window];
                
                CGFloat tx = fabs(translation.x);
                CGFloat ty = fabs(translation.y);
                
                if (tx > ty) {
                    //左右滑动
                    if (translation.x > 0) {
                        //向右滑动；
                        panDirection = GFPanGestureDirectionRight;
                    }else{
                        //向左滑动；
                        panDirection = GFPanGestureDirectionLeft;
                    }
                }else{
                    if(translation.y > 0){
                        //向下滑动；
                        panDirection = GFPanGestureDirectionDown;
                        
                    }else{
                        //向上滑动；
                        panDirection = GFPanGestureDirectionUp;
                        
                    }
                }
            }
            
            switch (panDirection) {
                case GFPanGestureDirectionUp:
                case GFPanGestureDirectionDown:
                {
                    CGPoint endPanPoint = [pan locationInView:self.view.window];
                    //偏移量
                    CGFloat detaly = endPanPoint.y - benginPanPoint.y;
                    //目标x
                    CGFloat destY = panViewY + detaly;
                    
                    self.panView.top=destY;
                    
                    ///更新手势方向
                    //说明下滑了；
                    if (destY > 0) {
                        //如果此时锁定的方向是UP，那么就需要更新！
                        if(GFPanGestureDirectionUp == panDirection){
                            panDirection = GFPanGestureDirectionDown;
                            [self nextViewWillAppear];
                        }
                    }else{
                        if (GFPanGestureDirectionDown == panDirection) {
                            panDirection = GFPanGestureDirectionUp;
                            [self prevViewWillAppear];
                        }
                    }
                    
                }
                    break;
                case GFPanGestureDirectionLeft:
                case GFPanGestureDirectionRight:
                {
                    CGPoint endPanPoint = [pan locationInView:self.view.window];
                    //偏移量
                    CGFloat detalx = endPanPoint.x - benginPanPoint.x;
                    //目标x
                    CGFloat destX = panViewX + detalx;
                    
                    self.slidingPanelView.left = destX;
                    if (destX > 0) {
                        if(GFPanGestureDirectionRight == panDirection){
                            panDirection = GFPanGestureDirectionRight;
                        }
                    }else{
                        if (GFPanGestureDirectionLeft == panDirection) {
                            panDirection = GFPanGestureDirectionLeft;
                        }
                    }
                    ///更新手势方向
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            CGFloat needPanHeight = 80;
            
            switch (panDirection) {
                case GFPanGestureDirectionUp:
                {
                    //向上滑动；
                    CGFloat descY = 0;
                    
                    if (self.panView.top < -needPanHeight) {
                        descY = -self.panView.height;
                        [self nextViewDidAppear];
                        [UIView animateWithDuration:0.25 animations:^{
                            self.panView.top = descY;
                        }completion:^(BOOL finished) {
                            self.panView.alpha=0;
                            self.panView.top = 0;
                            [UIView animateWithDuration:0.5 animations:^{
                                self.panView.alpha=1;
                            } completion:^(BOOL finished) {
                                
                            }];
                        }];
                    }else
                    {
                        self.panView.top = 0;
                    }
                    
                    
                }
                    break;
                case GFPanGestureDirectionDown:
                {
                    CGFloat descY = 0;
                    if (self.panView.top > needPanHeight) {
                        descY = self.panView.height;
                        [self prevViewDidAppear];
                        [UIView animateWithDuration:0.25 animations:^{
                            self.panView.top = descY;
                        }completion:^(BOOL finished) {
                            self.panView.alpha=0;
                            self.panView.top = 0;
                            [UIView animateWithDuration:0.5 animations:^{
                                self.panView.alpha=1;
                            } completion:^(BOOL finished) {
                                
                            }];
                            
                        }];
                    }else
                    {
                        self.panView.top = 0;
                    }
                    
                }
                    break;
                case GFPanGestureDirectionRight:
                {
                    CGFloat descX = 0;
                    
                    if (self.slidingPanelView.left > needPanHeight) {
                        descX = self.slidingPanelView.width;
                    }
                    [UIView animateWithDuration:0.25 animations:^{
                        self.slidingPanelView.left = descX;
                    }completion:^(BOOL finished) {
                        self.slidingPanelView.left = descX;
                    }];
                    
                }
                    break;
                case GFPanGestureDirectionLeft:
                {
                    CGFloat descX = self.slidingPanelView.width;
                    
                    if (self.slidingPanelView.left < panViewX-needPanHeight) {
                        descX = 0;
                    }
                    [UIView animateWithDuration:0.25 animations:^{
                        self.slidingPanelView.left = descX;
                    }completion:^(BOOL finished) {
                        self.slidingPanelView.left = descX;
                    }];
                    
                }
                    break;
                default:
                    break;
            }
            //重置
            panDirection = GFPanGestureDirectionUnKnown;
        }
            break;
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
            
            break;
        default:{}
            break;
    }
}
@end
