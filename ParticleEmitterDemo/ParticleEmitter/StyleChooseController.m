//
//  StyleChooseControllerViewController.m
//  ParticleEmitter
//
//  Created by 李帅 on 2016/12/29.
//  Copyright © 2016年 Company. All rights reserved.
//

#import "StyleChooseController.h"
#import "UIButton+Category.h"
#import "LSEmitterManager.h"
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
@interface StyleChooseController ()
@property (nonatomic, weak) UIButton *controlBtn;
@end

@implementation StyleChooseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self creatControlView];
    [self creatChooseView];
}

- (void)creatControlView{
    UIButton *controlBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    controlBtn.frame = CGRectMake(SCREEN_WIDTH * 0.5 - 60, 64, 120, 60);
    controlBtn.backgroundColor = [UIColor whiteColor];
    controlBtn.titleLabel.font = [UIFont systemFontOfSize:30.0];
    [controlBtn setTitle:@"不共存" forState:UIControlStateNormal];
    [controlBtn setTitle:@"共存" forState:UIControlStateSelected];
    [controlBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [controlBtn addTarget:self action:@selector(controlBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.controlBtn = controlBtn;
    [self.view addSubview:controlBtn];
}

- (void)creatChooseView{
    for (NSInteger n = 0; n < 3; n ++) {
        NSString *styleName;
        switch (n) {
            case 0:
                styleName = @"snow";
                break;
            case 1:
                styleName = @"leaves";
                break;
            case 2:
                styleName = @"rain";
                break;
            default:
                break;
        }
        UIButton *styleBtn = [self creatCommenStyleBtnWithName:styleName frame:CGRectMake(SCREEN_WIDTH * 0.5 - 50, (n + 1) * SCREEN_HEIGHT * 0.25, 100, 60)];
        styleBtn.tag = 100 + n;
        
    }
}

- (UIButton *)creatCommenStyleBtnWithName:(NSString *)name frame:(CGRect)frame{
    UIButton *styleBtn = [[UIButton alloc]initWithFrame:frame];
    [styleBtn setBackgroundColor:[UIColor grayColor] forState:UIControlStateNormal];
    [styleBtn setBackgroundColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [styleBtn setTitle:name forState:UIControlStateNormal];
    [styleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [styleBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    styleBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    styleBtn.titleLabel.font = [UIFont systemFontOfSize:30.0];
    [styleBtn addTarget:self action:@selector(chooseStyle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:styleBtn];
    
    return styleBtn;
}

- (void)controlBtnAction:(UIButton *)btn{
    btn.selected = !btn.selected;
}

- (void)chooseStyle:(UIButton *)btn{
    if (!self.controlBtn.selected) {
        [[LSEmitterManager shareInstancetype] removeAllAnimation];
    }
    if (btn.tag == 100) {//雪花
        [[LSEmitterManager shareInstancetype] showAnimationInView:self.view withAnimationStyle:LSAnimationStyleOfSnow];
    }else if (btn.tag == 101) {//落叶
        [[LSEmitterManager shareInstancetype] showAnimationInView:self.view withAnimationStyle:LSAnimationStyleOfLeaves];
    }else if (btn.tag == 102) {//雨滴
        [[LSEmitterManager shareInstancetype] showAnimationInView:self.view withAnimationStyle:LSAnimationStyleOfRain];
    }
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
