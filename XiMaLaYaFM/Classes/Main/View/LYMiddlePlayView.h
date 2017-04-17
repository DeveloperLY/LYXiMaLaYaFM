//
//  LYMiddlePlayView.h
//  XiMaLaYaFM
//
//  Created by LiuY on 2017/4/17.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYMiddlePlayView : UIView

/** 控制是否正在播放 */
@property (nonatomic, assign) BOOL isPlaying;

/** 播放的专辑图片 */
@property (nonatomic, strong) UIImage *middleImage;

/** 点击中间按钮的执行代码块 */
@property (nonatomic, copy) void(^middleDidClickBlock)(BOOL isPlaying);

/**
 *  返回单例
 *
 *  @return 单例对象
 */
+ (instancetype)shareInstance;

/**
 *  快速创建视图类方法
 *
 *  @return 对象
 */
+ (instancetype)middlePlayView;

@end
