//
//  LSEmitterRainCell.h
//  ParticleEmitter
//
//  Created by 李帅 on 2016/12/29.
//  Copyright © 2016年 Company. All rights reserved.
//

#import "BaseParticleCell.h"
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import "UIImage+Extension.h"

@interface LSEmitterRainCell : BaseParticleCell
/**
 *  传入粒子图片样式名称,粒子半径,粒子移动速度,生成粒子
 *
 *  @param cellImg  粒子图片样式名称
 *  @param radious  粒子半径
 *  @param velocity 粒子移动速度
 *
 *  @return 粒子
 */
+ (instancetype)rainCellWithCellImg:(NSString *)cellImg andRadious:(CGFloat)radious andVelocity:(CGFloat)velocity andDirection:(EmitterParticleDirection)direction;
@end
