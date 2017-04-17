//
//  LYTabBarController.m
//  XiMaLaYaFM
//
//  Created by LiuY on 2017/4/17.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import "LYTabBarController.h"
#import "LYNavigationController.h"
#import "LYTabBar.h"

#import "UIImage+LYAdd.h"
#import "ViewController.h"


@interface LYTabBarController ()

@end

@implementation LYTabBarController

+ (instancetype)shareInstance {
    static LYTabBarController *tabBarController;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabBarController = [[LYTabBarController alloc] init];
    });
    return tabBarController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加所有的子控制器
    [self setUpAllChildViewController];
    
    // 自定义TabBar
    [self setUpTabBar];
}

- (void)setUpTabBar {
    // 创建LYTabBar
    LYTabBar *tabBar = [[LYTabBar alloc] initWithFrame:self.tabBar.frame];
    tabBar.playButtonDidClickBlock = ^(BOOL isPlaying) {
        if (isPlaying) {
            NSLog(@"正在播放...");
        } else {
            NSLog(@"暂停中...");
        }
    };
    // 设置LYTabBar
    [self setValue:tabBar forKey:@"tabBar"];
}

- (void)setUpAllChildViewController {
    // 发现
    [self setupOneChildViewController:[ViewController new] image:[UIImage imageWithOriginalImageName:@"tabbar_find_n"] selectImage:[UIImage imageWithOriginalImageName:@"tabbar_find_h"] title:nil];
    
    // 订阅听
    [self setupOneChildViewController:[UIViewController new] image:[UIImage imageWithOriginalImageName:@"tabbar_sound_n"] selectImage:[UIImage imageWithOriginalImageName:@"tabbar_sound_h"] title:nil];
    
    // 下载听
    [self setupOneChildViewController:[UIViewController new] image:[UIImage imageWithOriginalImageName:@"tabbar_download_n"] selectImage:[UIImage imageWithOriginalImageName:@"tabbar_download_h"] title:nil];
    
    // 我的
    [self setupOneChildViewController:[UIViewController new] image:[UIImage imageWithOriginalImageName:@"tabbar_me_n"] selectImage:[UIImage imageWithOriginalImageName:@"tabbar_me_h"] title:nil];
}

/**
 *  添加一个子控制器的方法
 */
- (void)setupOneChildViewController:(UIViewController *)viewController image:(UIImage *)image selectImage:(UIImage *)selectImage title:(NSString *)title {
    viewController.tabBarItem.image = image;
    viewController.tabBarItem.selectedImage = selectImage;
    viewController.tabBarItem.title = title;
    
    LYNavigationController *navVC = [[LYNavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:navVC];
}

@end
