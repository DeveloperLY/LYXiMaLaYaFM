//
//  LYTabBar.m
//  XiMaLaYaFM
//
//  Created by LiuY on 2017/4/17.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import "LYTabBar.h"
#import "LYMiddlePlayView.h"
#import "UIView+LYAdd.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface LYTabBar ()

/** 中间播放按钮 */
@property (nonatomic, weak) LYMiddlePlayView *middlePlayView;

@end

@implementation LYTabBar


#pragma mark - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 初始化设置
        [self setUpInit];
    }
    return self;
}

- (void)setUpInit {
    // 设置样式, 去除tabbar上面的黑线
    self.barStyle = UIBarStyleBlack;
    // 设置tabbar 背景图片
    self.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];
    
    // 设置播放按钮的位置
    CGFloat width = 65.0f, height = 65.0f;
    self.middlePlayView.frame = CGRectMake((kScreenWidth - width) * 0.5f, (kScreenHeight - height), width, height);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // items个数
    NSInteger count = self.items.count;
    
    // 所有子控件
    NSArray *subViews = self.subviews;
    
    CGFloat btnX = 0.0f;
    CGFloat btnY = 5.0f;
    CGFloat btnW = self.width / (count + 1);
    CGFloat btnH = self.height;
    
    // 跳转子控件的位置
    NSInteger index = 0;
    for (UIView *tabBarButton in subViews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (index == count / 2) {
                index ++;
            }
            btnX = index * btnW;
            // 调整子控件的位置
            tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
            
            index++;
        }
    }
    
    // 调整播放按钮位置
    self.middlePlayView.centerX = self.width * 0.5f;
    self.middlePlayView.y = self.height - self.middlePlayView.height;
}

// 处理播放按钮的点击区域
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    // 设置允许交互的区域
    // 转换点击在tabbar上的坐标点, 到中间按钮上
    CGPoint pointInMiddleBtn = [self convertPoint:point toView:self.middlePlayView];
    
    // 确定中间按钮的圆心
    CGPoint middleBtnCenter = CGPointMake(32.5f, 32.5f);
    
    // 计算点击的位置距离圆心的距离
    CGFloat distance = sqrt(pow(pointInMiddleBtn.x - middleBtnCenter.x, 2) + pow(pointInMiddleBtn.y - middleBtnCenter.y, 2));
    
    // 判定中间按钮区域之外
    if (distance > 32.5 && pointInMiddleBtn.y < 18) {
        return NO;
    }
    
    return YES;
}


#pragma mark - Getter And Setter
/**
 *  懒加载中间播放按钮
 *
 *  @return 中间播放按钮
 */
- (LYMiddlePlayView *)middlePlayView {
    if (!_middlePlayView) {
        LYMiddlePlayView *middlePlayView = [LYMiddlePlayView shareInstance];
        [self addSubview:middlePlayView];
        _middlePlayView = middlePlayView;
    }
    return _middlePlayView;
}

- (void)setPlayButtonDidClickBlock:(void (^)(BOOL))playButtonDidClickBlock {
    self.middlePlayView.middleDidClickBlock = playButtonDidClickBlock;
}

@end
