//
//  LSEMitterCustomLayer.m
//  ParticleEmitter
//
//  Created by 李帅 on 2016/12/29.
//  Copyright © 2016年 Company. All rights reserved.
//

#import "LSEmitterCustomLayer.h"
#import "UIImage+Extension.h"
#import "LSEmitterLeavesCell.h"
#import "LSEmitterSnowCell.h"
#import "LSEmitterRainCell.h"
@interface LSEmitterCustomLayer()
@property (nonatomic, strong) NSMutableArray *layerArr;
@end
@implementation LSEmitterCustomLayer
#pragma mark 粒子发射器

+ (instancetype)shareInstancetype{
    static LSEmitterCustomLayer *customLayer;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        customLayer = [[LSEmitterCustomLayer alloc] init];
    });
    return customLayer;
}

//下面这个方法公用,发射器的参数由外部传入
- (instancetype)addCustomLayerInView:(UIView *)view atPosition:(CGPoint)position inSize:(CGSize)size
{
    LSEmitterCustomLayer *customLayer = (LSEmitterCustomLayer*)[CAEmitterLayer layer];
    
    //例子发射器位置，可以动态设置
    customLayer.emitterPosition = position;
    customLayer.emitterSize = CGSizeMake(size.width, size.height);
    
    //超出图层的雪花全部裁掉
    view.layer.masksToBounds=YES;
    
    //发射模式
    customLayer.emitterMode = kCAEmitterLayerSurface;
    
    //粒子边缘的颜色,设置白色会有模糊效果
    customLayer.shadowColor = [[UIColor whiteColor] CGColor];
    
    //添加图层到显示雪花的view的layer
    [view.layer addSublayer:customLayer];
    [self.layerArr addObject:customLayer];
    return customLayer;
}

#pragma mark 树叶

+ (void)leavesLayerInView:(UIView *)view atPosition:(CGPoint)position andDirection:(EmitterParticleDirection)direction andRadious:(CGFloat)radious andCellImg:(NSString *)cellImg
{
    //创建树叶所在图层layer
    LSEmitterCustomLayer *leavesLayer = [[LSEmitterCustomLayer shareInstancetype] addCustomLayerInView:view atPosition:position inSize:CGSizeMake(view.frame.size.width, view.frame.size.height)];
    
    //粒子
    LSEmitterLeavesCell *emitterCell = [LSEmitterLeavesCell leavesCellWithCellImg:cellImg andRadious:radious andVelocity:20 andDirection:direction];
    
    leavesLayer.emitterCells = @[emitterCell];
}

- (void)addleavesLayerInView:(UIView *)view
{
    //树叶粒子所在view,发射树叶的位置,树叶飘向的方向,树叶粒子半径,树叶粒子图片
    [LSEmitterCustomLayer leavesLayerInView:view atPosition:CGPointMake(-60,-20) andDirection:EmitterParticleDirectionToBottom andRadious:19 andCellImg:nil];
    
    [LSEmitterCustomLayer leavesLayerInView:view atPosition:CGPointMake(-60,-20) andDirection:EmitterParticleDirectionToBottom andRadious:9 andCellImg:nil];
    
    [LSEmitterCustomLayer leavesLayerInView:view atPosition:CGPointMake(-60,view.frame.size.height*0.33) andDirection:EmitterParticleDirectionToBottom andRadious:14 andCellImg:nil];
    
}

#pragma mark 雪花

+ (void)snowLayerInView:(UIView *)view atPosition:(CGPoint)position andDirection:(EmitterParticleDirection)direction andRadious:(CGFloat)radious andCellImg:(NSString *)cellImg
{
//    NSLog(@"调用了 - snowLayerInView");
    
    //创建雪花所在图层layer
    LSEmitterCustomLayer *snowLayer=[[LSEmitterCustomLayer shareInstancetype] addCustomLayerInView:view atPosition:position inSize:CGSizeMake(view.frame.size.width, view.frame.size.height)];
    
    //粒子
    LSEmitterSnowCell *emitterCell=[LSEmitterSnowCell snowCellWithCellImg:cellImg andRadious:radious andVelocity:20 andDirection:direction];
    
    snowLayer.emitterCells=@[emitterCell];
}


- (void)addSnowLayerInView:(UIView *)view
{
//    NSLog(@"调用了 - addSnowLayerInView");
    //雪花粒子所在view,发射雪花的位置,雪花飘向的方向,雪花粒子半径,雪花粒子图片
    [LSEmitterCustomLayer snowLayerInView:view atPosition:CGPointMake(-60,-20) andDirection:EmitterParticleDirectionToBottom andRadious:19 andCellImg:nil];
    
    [LSEmitterCustomLayer snowLayerInView:view atPosition:CGPointMake(-60,-20) andDirection:EmitterParticleDirectionToBottom andRadious:9 andCellImg:nil];
    
    [LSEmitterCustomLayer snowLayerInView:view atPosition:CGPointMake(-60,view.frame.size.height*0.33) andDirection:EmitterParticleDirectionToBottom andRadious:14 andCellImg:nil];
    
}

#pragma mark 下雨

+ (void)rainLayerInView:(UIView *)view atPosition:(CGPoint)position andDirection:(EmitterParticleDirection)direction andRadious:(CGFloat)radious andCellImg:(NSString *)cellImg
{
    //创建雨点所在图层layer
    LSEmitterCustomLayer *rainLayer=[[LSEmitterCustomLayer shareInstancetype] addCustomLayerInView:view atPosition:position inSize:CGSizeMake(view.frame.size.width, view.frame.size.height)];
    rainLayer.emitterPosition = CGPointMake(320 / 2.0, -30);
    rainLayer.emitterSize	  = CGSizeMake(320 * 2.0, 0);
    
    rainLayer.emitterMode   = kCAEmitterLayerOutline;
    rainLayer.emitterShape	= kCAEmitterLayerLine;
    
    rainLayer.shadowOpacity = 1.0;
    rainLayer.shadowRadius  = 0.0;
    rainLayer.shadowOffset  = CGSizeMake(0.0, 1.0);
    rainLayer.shadowColor   = [[UIColor whiteColor] CGColor];
    rainLayer.seed = (arc4random()%100)+1;
    
    //粒子
    LSEmitterRainCell *emitterCell = [LSEmitterRainCell rainCellWithCellImg:cellImg andRadious:radious andVelocity:20 andDirection:direction];
    
    //    emitterCell.contents		= (id)[image CGImage];
    emitterCell.color			= [[UIColor colorWithRed:0.600 green:0.658 blue:0.743 alpha:1.000] CGColor];
    
    
    rainLayer.emitterCells=@[emitterCell];
}

- (void)addRainLayerInView:(UIView *)view {
    
    [LSEmitterCustomLayer rainLayerInView:view atPosition:CGPointMake(160,120) andDirection:EmitterParticleDirectionToBottom andRadious:19 andCellImg:nil];
    
    [LSEmitterCustomLayer rainLayerInView:view atPosition:CGPointMake(-60,-20) andDirection:EmitterParticleDirectionToBottom andRadious:9 andCellImg:nil];
    
    [LSEmitterCustomLayer rainLayerInView:view atPosition:CGPointMake(-60,view.frame.size.height*0.33) andDirection:EmitterParticleDirectionToBottom andRadious:14 andCellImg:nil];
    
}

- (void)removeAllAnimationLayer{
    for (LSEmitterCustomLayer *layer in self.layerArr) {
        [layer removeFromSuperlayer];
    }
    [self.layerArr removeAllObjects];
}

- (NSMutableArray *)layerArr{
    if (!_layerArr) {
        _layerArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _layerArr;
}
@end
