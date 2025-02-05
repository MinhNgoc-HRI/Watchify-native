//
//  RippleEffectView.m
//  Watchify
//
//  Created by Minh Ngọc on 04/02/2025.
//

#import "RippleEffectView.h"

@implementation RippleEffectView

- (void)addRippleAtLocation:(UIView*)rView {
    // Giả sử rView là một UIView đã được khởi tạo và thêm vào view
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, rView.bounds.size.width, rView.bounds.size.height)];
//    CGPoint shapePosition = CGPointMake(rView.bounds.size.width / 2.0, rView.bounds.size.height / 2.0);

    for (NSInteger i = 0; i < 4; i++) {
        // Tạo một CAShapeLayer cho mỗi ripple
        CAShapeLayer *rippleShape = [CAShapeLayer layer];
        
        // Cấu hình rippleShape theo nhu cầu của bạn (ví dụ, thiết lập path, vị trí, màu, v.v.)
        rippleShape.path = path.CGPath;
        // Lưu ý: Nếu bạn muốn sử dụng position, hãy cân nhắc điều chỉnh frame hoặc anchorPoint.
        rippleShape.position = CGPointZero;
        rippleShape.fillColor = [UIColor clearColor].CGColor;
        rippleShape.strokeColor = [UIColor whiteColor].CGColor;
        rippleShape.lineWidth = 4.0;
        
        // Thêm rippleShape vào layer của rView
        [rView.layer addSublayer:rippleShape];
        
        // Tạo animation scale cho rippleShape
        CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnim.fromValue = @1.0;
        scaleAnim.toValue = @2.0;
        
        // Tạo animation opacity cho rippleShape
        CABasicAnimation *opacityAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
        opacityAnim.fromValue = @1.0;
        opacityAnim.toValue = @0.0;
        
        // Gom nhóm các animation lại với nhau
        CAAnimationGroup *animation = [CAAnimationGroup animation];
        animation.animations = @[scaleAnim, opacityAnim];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        animation.repeatCount = INFINITY;
        animation.duration = 2.0;
        animation.removedOnCompletion = NO;
        
        // Phần quan trọng: tạo độ chênh thời gian giữa các ripple
        double timeInBetweenRipples = 0.2;
        animation.timeOffset = timeInBetweenRipples * i;
        animation.speed = 0.5;
        
        // Thêm animation vào rippleShape với một key khác nhau cho từng ripple
        NSString *animationKey = [NSString stringWithFormat:@"rippleEffect%ld", (long)i];
        [rippleShape addAnimation:animation forKey:animationKey];
    }

}

@end
