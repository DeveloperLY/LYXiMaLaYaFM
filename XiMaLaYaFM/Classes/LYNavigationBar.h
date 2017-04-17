//
//  LYNavigationBar.h
//  XiMaLaYaFM
//
//  Created by LiuY on 2017/4/17.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYNavigationBar : UINavigationBar

/**
 *  设置全局的导航栏背景图
 *
 *  @param globalImage 全局导航栏背景图片
 */
+ (void)setGlobalBackGroundImage: (UIImage *)globalImage;

/**
 *  设置全局导航栏标题颜色和文字大小
 *
 *  @param globalTextColor 全局导航栏标题颜色
 *  @param fontSize        全局导航栏字体大小
 */
+ (void)setGlobalTextColor:(UIColor *)globalTextColor andFontSize:(CGFloat)fontSize;

@end
