//
//  BaseLiveSlideViewController.m
//  BaseLiveDemo
//
//  Created by lisai on 17/2/15.
//  Copyright © 2017年 Sai. All rights reserved.
//

#import "BaseLiveSlideViewController.h"
#import "BaseLiveSlideViewController+PanGesture.h"
@interface BaseLiveSlideViewController ()

@end

@implementation BaseLiveSlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panedView:)];
    [self.view addGestureRecognizer:panGes];
    [self.view addSubview:self.panView];
    [self.panView addSubview:self.slidingPanelView];
}

-(UIView *)panView
{
    if (!_panView) {
        _panView=[ [UIView alloc] initWithFrame:self.view.bounds];
    }
    return _panView;
}
-(UIView *)slidingPanelView
{
    if (!_slidingPanelView) {
        _slidingPanelView=[ [UIView alloc] initWithFrame:self.view.bounds];
    }
    return _slidingPanelView;
}
///滑动的时候要切换背景
- (void)nextViewWillAppear
{
    
}

- (void)prevViewWillAppear
{
    
}

- (void)nextViewDidAppear
{
    
}

- (void)prevViewDidAppear
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
