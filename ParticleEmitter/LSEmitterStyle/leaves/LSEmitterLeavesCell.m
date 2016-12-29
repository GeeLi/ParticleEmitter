//
//  LSEmitterLeavesCell.m
//  ParticleEmitter
//
//  Created by 李帅 on 2016/12/29.
//  Copyright © 2016年 Company. All rights reserved.
//

#import "LSEmitterLeavesCell.h"

@implementation LSEmitterLeavesCell
+ (instancetype)leavesCellWithCellImg:(NSString *)cellImg andRadious:(CGFloat)radious andVelocity:(CGFloat)velocity andDirection:(EmitterParticleDirection)direction
{
    
    NSString * const leavesPic = @"leaves.png";//树叶图片样式
    
    LSEmitterLeavesCell *cell=(LSEmitterLeavesCell *)[[self alloc] init];
    cell.birthRate = 0.3;
    cell.name = @"leaves";
    
    //设置雪花图片
    UIImage *img;
    if (cellImg.length==0) {
        
        img=[UIImage imageNamed:leavesPic];
    }else{
        
        img=[UIImage imageNamed:cellImg];
    }
    //设置雪花半径大小
    img=[UIImage image:img scaleToSize:CGSizeMake(radious, radious)];
    cell.contents=(id)[img CGImage];
    
    //速率与半径大小正相关
    cell.velocity=radious*2;
    
    //设置雪花飘向的方向
    switch (direction) {
        case EmitterParticleDirectionToLeft:
            //重力加速方向,y代表竖直,x为横向,数值越大,速度越快
            cell.xAcceleration=-1;
            //向周围发散的角度
            cell.emissionRange = -0.5* M_PI;
            break;
        case EmitterParticleDirectionToRight:
            cell.xAcceleration=1;
            cell.emissionRange = 0.25* M_PI;
            break;
        case EmitterParticleDirectionToTop:
            cell.yAcceleration=-1;
            cell.emissionRange = 0.5* M_PI;
            break;
        case EmitterParticleDirectionToBottom:
            cell.yAcceleration=1;
            cell.emissionRange = 0.5* M_PI;
            break;
            
    }
    
    return cell;
    
}

@end
