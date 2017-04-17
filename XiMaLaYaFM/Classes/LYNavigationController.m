//
//  LYNavigationController.m
//  XiMaLaYaFM
//
//  Created by LiuY on 2017/4/17.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import "LYNavigationController.h"
#import "LYNavigationBar.h"
#import "LYMiddlePlayView.h"

@interface LYNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation LYNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        [self setValue:[[LYNavigationBar alloc] init] forKey:@"navigationBar"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加全屏滑动返回
    [self addPanGestureForView];
}

/**
 *  添加全屏滑动
 */
- (void)addPanGestureForView {
    // 全屏滑动:添加一个pan手势,全屏滑动返回
    UIPanGestureRecognizer *panGester = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:NSSelectorFromString(@"handleNavigationTransition:")];
    panGester.delegate = self;
    [self.view addGestureRecognizer:panGester];
    
    // 禁止边缘滑动手势
    self.interactivePopGestureRecognizer.enabled = NO;
}

/**
 *  当控制器, 拿到导航控制器(需要是这个子类), 进行压栈时, 都会调用这个方法
 *
 *  @param viewController 要压栈的控制器
 *  @param animated       动画
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 非根控制器才需要设置
    if (self.childViewControllers.count) {
        /**
         * 设置返回按钮
         * 只要把系统返回按钮覆盖,就不会再有滑动返回功能
         */
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_back_n"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
        // 隐藏底部tabBar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
    // 是否需要显示中间播放按钮
    if (viewController.view.tag == 10086) {
        viewController.view.tag = 0;
        LYMiddlePlayView *middlePlayView = [LYMiddlePlayView middlePlayView];
        
        middlePlayView.middleDidClickBlock = [LYMiddlePlayView shareInstance].middleDidClickBlock;
        middlePlayView.isPlaying = [LYMiddlePlayView shareInstance].isPlaying;
        middlePlayView.middleImage = [LYMiddlePlayView shareInstance].middleImage;
        
        CGRect frame = middlePlayView.frame;
        frame.size.width = 65.0f;
        frame.size.height = 65.0f;
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        frame.origin.x = (screenSize.width - 65.0f) * 0.5f;
        frame.origin.y = screenSize.height - 65.0f;
        middlePlayView.frame = frame;
        [viewController.view addSubview:middlePlayView];
    }
}


- (void)back {
    [self popViewControllerAnimated:YES];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    // 非根控制器才需要触发手势, 否则会造成假死状态
    return self.childViewControllers.count > 1;
}

@end
