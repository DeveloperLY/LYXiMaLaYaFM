//
//  LYMiddlePlayView.m
//  XiMaLaYaFM
//
//  Created by LiuY on 2017/4/17.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import "LYMiddlePlayView.h"
#import "CALayer+LYAdd.h"

NSString * const kNotificationPlayState = @"kNotificationPlayState";
NSString * const kNotificationPlayImage = @"kNotificationPlayImage";

@interface LYMiddlePlayView ()

/** 中间播放的专辑图片 */
@property (weak, nonatomic) IBOutlet UIImageView *middleImageView;

/** 播放按钮 */
@property (weak, nonatomic) IBOutlet UIButton *playButton;

@end

@implementation LYMiddlePlayView

static LYMiddlePlayView *_shareInstance;

#pragma mark - Publice Method
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstance = [LYMiddlePlayView middlePlayView];
    });
    return _shareInstance;
}

+ (instancetype)middlePlayView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

#pragma mark - Life Cycle
- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.middleImageView.layer.masksToBounds = YES;
    self.middleImage = self.middleImageView.image;
    
    [self.middleImageView.layer removeAnimationForKey:@"playAnnimation"];
    CABasicAnimation *basicAnnimation = [[CABasicAnimation alloc] init];
    basicAnnimation.keyPath = @"transform.rotation.z";
    basicAnnimation.fromValue = @0;
    basicAnnimation.toValue = @(M_PI * 2);
    basicAnnimation.duration = 30;
    basicAnnimation.repeatCount = MAXFLOAT;
    basicAnnimation.removedOnCompletion = NO;
    [self.middleImageView.layer addAnimation:basicAnnimation forKey:@"playAnnimation"];
    
    [self.middleImageView.layer pauseAnimate];
    
    
    [self.playButton addTarget:self action:@selector(playButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 监听播放状态的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isPlayerPlay:) name:kNotificationPlayState object:nil];
    
    // 监听播放图片的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setPlayImage:) name:kNotificationPlayImage object:nil];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 专辑图片是圆形
    self.middleImageView.layer.cornerRadius = self.middleImageView.frame.size.width * 0.5;
}

- (void)dealloc {
    // 移除通知监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Private Method
- (void)isPlayerPlay:(NSNotification *)notification {
    BOOL isPlay = [notification.object boolValue];
    self.isPlaying = isPlay;
}

- (void)setPlayImage:(NSNotification *)notification {
    UIImage *image = notification.object;
    self.middleImage = image;
}

- (void)playButtonDidClick:(UIButton *)sender {
    if (self.middleDidClickBlock) {
        self.middleDidClickBlock(self.isPlaying);
    }
}

#pragma mark - Setter Method
- (void)setIsPlaying:(BOOL)isPlaying {
    if (_isPlaying == isPlaying) {
        return;
    }
    _isPlaying = isPlaying;
    
    if (isPlaying) {
        [self.playButton setImage:nil forState:UIControlStateNormal];
        [self.middleImageView.layer resumeAnimate];
    } else {
        [self.playButton setImage:[UIImage imageNamed:@"tabbar_np_play"] forState:UIControlStateNormal];
        [self.middleImageView.layer pauseAnimate];
    }
}

- (void)setMiddleImage:(UIImage *)middleImage {
    _middleImage = middleImage;
    self.middleImageView.image = middleImage;
}

@end
