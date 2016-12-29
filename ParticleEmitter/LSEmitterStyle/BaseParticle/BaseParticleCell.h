//
//  BaseParticleCell.h
//  ParticleEmitter
//
//  Created by 李帅 on 2016/12/29.
//  Copyright © 2016年 Company. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
//飘散方向
typedef enum{
    EmitterParticleDirectionToLeft,
    EmitterParticleDirectionToRight,
    EmitterParticleDirectionToTop,
    EmitterParticleDirectionToBottom,
} EmitterParticleDirection;
@interface BaseParticleCell : CAEmitterCell

@end
