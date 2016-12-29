//
//  LSEmitterManager.h
//  ParticleEmitter
//
//  Created by 李帅 on 2016/12/29.
//  Copyright © 2016年 Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//动画形式
typedef enum{
    LSAnimationStyleOfSnow,     // 雪花
    LSAnimationStyleOfLeaves,   // 树叶
    LSAnimationStyleOfRain,     // 雨水
} LSAnimationStyle;

@interface LSEmitterManager : NSObject
+ (instancetype)shareInstancetype;

/**
 *  在一个view上展示传入的动画类型style
 *
 *  @param superView        需要展示传入的动画的View
 *  @param YFAnimationStyle 传入的动画类型
 */
- (void)showAnimationInView:(UIView *)superView withAnimationStyle:(LSAnimationStyle)YFAnimationStyle;
- (void)removeAllAnimation;
@end
