//
//  LSEmitterRainCell.m
//  ParticleEmitter
//
//  Created by 李帅 on 2016/12/29.
//  Copyright © 2016年 Company. All rights reserved.
//

#import "LSEmitterRainCell.h"

@implementation LSEmitterRainCell
+ (instancetype)rainCellWithCellImg:(NSString *)cellImg andRadious:(CGFloat)radious andVelocity:(CGFloat)velocity andDirection:(EmitterParticleDirection)direction
{
    
    NSString * const rainPic = @"rain.png";// 雨水的默认图片
    
    LSEmitterRainCell *cell=(LSEmitterRainCell *)[[self alloc] init];
    cell.name = @"rain";
    cell.birthRate		= 10.0;
    cell.lifetime		= 120.0;
    
    //设置雪花图片
    UIImage *img;
    if (cellImg.length==0) {
        img = [UIImage imageNamed:rainPic];
    }else{
        img=[UIImage imageNamed:cellImg];
    }
    // 设置雪花半径大小
//        img=[UIImage image:img scaleToSize:CGSizeMake(radious, radious)];
    img=[UIImage image:img scaleToSize:CGSizeMake(10, 10)];
    cell.contents = (id)[img CGImage];
    
    //速率与半径大小正相关
    cell.velocity = radious*2;
    
    //重力加速方向,y代表竖直,x为横向,数值越大,速度越快
    cell.yAcceleration = 4;//4
    //向周围发散的角度
    cell.emissionRange = 0.5* M_PI;
    
    
    return cell;
    
}


+ (UIImage*)imageWithColor:(UIColor*)color {
    
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
