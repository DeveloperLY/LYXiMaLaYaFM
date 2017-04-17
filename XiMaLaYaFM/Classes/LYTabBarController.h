//
//  LYTabBarController.h
//  XiMaLaYaFM
//
//  Created by LiuY on 2017/4/17.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYTabBarController : UITabBarController

/**
 *  获取单例对象
 *
 *  @return LYTabBarController
 */
+ (instancetype)shareInstance;

@end
