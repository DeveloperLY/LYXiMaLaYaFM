//
//  LYTabBar.h
//  XiMaLaYaFM
//
//  Created by LiuY on 2017/4/17.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYTabBar : UITabBar

/** 中间播放按钮点击代码块 */
@property (nonatomic, copy) void(^playButtonDidClickBlock)(BOOL isPlaying);

@end
