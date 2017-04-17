//
//  LYNavigationBar.m
//  XiMaLaYaFM
//
//  Created by LiuY on 2017/4/17.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import "LYNavigationBar.h"

@implementation LYNavigationBar

+ (void)setGlobalBackGroundImage:(UIImage *)globalImage {
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:NSClassFromString(@"LYVNavigationController"), nil];
    [navBar setBackgroundImage:globalImage forBarMetrics:UIBarMetricsDefault];
}

+ (void)setGlobalTextColor:(UIColor *)globalTextColor andFontSize:(CGFloat)fontSize {
    if (!globalTextColor) {
        return;
    }
    
    if (fontSize < 6.0f || fontSize > 40.0f) {
        fontSize = 16.0f;
    }
    
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:NSClassFromString(@"LYVNavigationController"), nil];
    // 设置导航栏颜色
    NSDictionary *titleDict = @{
                                NSForegroundColorAttributeName : globalTextColor,
                                NSFontAttributeName : [UIFont systemFontOfSize:fontSize]
                               };
    [navBar setTitleTextAttributes:titleDict];
}

@end
