//
//  LYTestViewController.m
//  LYXiMaLaYaFM
//
//  Created by LiuY on 2017/4/25.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import "LYTestViewController.h"
#import "LYTest2ViewController.h"

@interface LYTestViewController ()

@end

@implementation LYTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static BOOL isPlay = NO;
    isPlay = !isPlay;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotificationPlayState" object:@(isPlay)];
    UIImage *image = [UIImage imageNamed:@"zxy_icon"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotificationPlayImage" object:image];
    [self.navigationController pushViewController:[LYTest2ViewController new] animated:YES];

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
