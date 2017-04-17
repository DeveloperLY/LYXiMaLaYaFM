//
//  LYViewController.m
//  XiMaLaYaFM
//
//  Created by LiuY on 2017/4/18.
//  Copyright © 2017年 DeveloperLY. All rights reserved.
//

#import "LYViewController.h"

@interface LYViewController ()

@end

@implementation LYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.tag = 10086;
    self.view.backgroundColor = [UIColor brownColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
