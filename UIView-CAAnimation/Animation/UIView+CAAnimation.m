//
//  UIView+CAAnimation.m
//  test
//
//  Created by Jason on 2017/6/2.
//  Copyright © 2017年 Jason. All rights reserved.
//

#import "UIView+CAAnimation.h"

static NSString *const CircleMaskAnimation = @"CircleMaskAnimation";

@implementation UIView (CAAnimation)

- (void)addCircleMaskAnimation {
    // Path Animation
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.delegate = self;
    animation.duration = 0.3;
    CGPathRef fromPath = ([self pathWithCircleRadius:5.0]);
    CGFloat x = self.bounds.size.width / 2;
    CGFloat y = self.bounds.size.height / 2;
    CGPathRef toPath = [self pathWithCircleRadius:sqrt(x*x+y*y)];
    animation.fromValue = (__bridge id _Nullable)(fromPath);
    animation.toValue = (__bridge id _Nullable)(toPath);
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    // Mask Layer
    self.layer.mask = [CAShapeLayer layer];
    [self.layer.mask addAnimation:animation forKey:CircleMaskAnimation];
}

- (CGPathRef)pathWithCircleRadius:(CGFloat)circleRadius {
    CGRect circleFrame = CGRectMake(0, 0, 2 * circleRadius, 2 * circleRadius);
    circleFrame.origin.x = CGRectGetMidX(self.bounds) - CGRectGetMidX(circleFrame);
    circleFrame.origin.y = CGRectGetMidY(self.bounds) - CGRectGetMidY(circleFrame);
    return ([UIBezierPath bezierPathWithOvalInRect:circleFrame].CGPath);
}

#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if ([anim isEqual:[self.layer.mask animationForKey:CircleMaskAnimation]]) {
        [self.layer.mask removeAnimationForKey:CircleMaskAnimation];
        self.layer.mask = nil;
    }
}

@end
