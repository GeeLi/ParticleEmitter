//
//  LSEMitterCustomLayer.h
//  ParticleEmitter
//
//  Created by 李帅 on 2016/12/29.
//  Copyright © 2016年 Company. All rights reserved.
//

#import "BaseParticleCell.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface LSEmitterCustomLayer : CAEmitterLayer
+ (instancetype)shareInstancetype;
/**
 *  将默认雪花效果显示到传入的view上
 *
 *  @param view 需要显示雪花效果的view
 */
- (void)addSnowLayerInView:(UIView *)view;

/**
 *  将默认的飘树叶动画效果显示到传入的view上
 *
 *  @param view 需要显示飘树叶效果的view
 */
- (void)addleavesLayerInView:(UIView *)view;

/**
 *  将默认的下雨动画效果显示到传入的view上
 *
 *  @param view 需要显示飘树叶效果的view
 */
- (void)addRainLayerInView:(UIView *)view;

- (void)removeAllAnimationLayer;
@end
