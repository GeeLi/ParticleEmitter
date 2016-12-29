
//
//  LSEmitterManager.m
//  ParticleEmitter
//
//  Created by 李帅 on 2016/12/29.
//  Copyright © 2016年 Company. All rights reserved.
//

#import "LSEmitterManager.h"
#import "LSEmitterCustomLayer.h"

@implementation LSEmitterManager

static id manager;

+ (instancetype)shareInstancetype{
    static LSEmitterManager *animationManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        animationManager = [[LSEmitterManager alloc] init];
    });
    return animationManager;
}

- (void)showAnimationInView:(UIView *)superView withAnimationStyle:(LSAnimationStyle)LSAnimationStyle{
    switch (LSAnimationStyle) {
        case LSAnimationStyleOfSnow:
            [[LSEmitterCustomLayer shareInstancetype] addSnowLayerInView:superView];
            break;
        case LSAnimationStyleOfLeaves:
            [[LSEmitterCustomLayer shareInstancetype] addleavesLayerInView:superView];
            break;
        case LSAnimationStyleOfRain:
            [[LSEmitterCustomLayer shareInstancetype] addRainLayerInView:superView];
        default:
            break;
    }
}

- (void)removeAllAnimation{
    [[LSEmitterCustomLayer shareInstancetype] removeAllAnimationLayer];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToke;
    dispatch_once(&onceToke, ^{
        if (manager == nil) {
            manager = [super allocWithZone:zone];
        }
    });
    return manager;
}
@end
