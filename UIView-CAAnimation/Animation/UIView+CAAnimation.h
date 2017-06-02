//
//  UIView+CAAnimation.h
//  test
//
//  Created by Jason on 2017/6/2.
//  Copyright © 2017年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CAAnimation)<CAAnimationDelegate>

/** 以中心点向外扩散的圆形遮罩动画 */
- (void)addCircleMaskAnimation;

@end
