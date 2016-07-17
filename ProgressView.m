//
//  ProgressView.m
//  circleAnimation
//
//  Created by ccc on 7/16/16.
//  Copyright © 2016 hexjoy. All rights reserved.
//

#import "ProgressView.h"

static const CGFloat kStartAngle = 1.5 * M_PI;
static const CGFloat kEndAngle = 3.5 * M_PI;

@interface ProgressView()
@property (nonatomic, assign) CGFloat radius;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) CAShapeLayer *progressCircle;
@end

@implementation ProgressView

+ (ProgressView *)initWithRadius:(CGFloat)radius side:(CGFloat)side color:(UIColor *)color{
    
    ProgressView *view = [[ProgressView alloc] init];
    
    view.radius = radius;
    view.bounds = CGRectMake(0, 0, radius*2, radius*2);
    
    view.progressCircle = [CAShapeLayer layer];
    // 内环进度条，半径稍微减小
    view.progressCircle.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(view.radius, view.radius) radius:radius-2 startAngle:kStartAngle endAngle:kEndAngle clockwise:YES].CGPath;
    view.progressCircle.fillColor = [UIColor clearColor].CGColor;
    view.progressCircle.strokeColor = color.CGColor;
    view.progressCircle.lineWidth = 3;
    view.progressCircle.strokeEnd = 0.0f;
    
    // 外面的圆圈
    CAShapeLayer *outCircle = [CAShapeLayer layer];
    outCircle.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(view.radius, view.radius) radius:radius startAngle:kStartAngle endAngle:kEndAngle clockwise:YES].CGPath;
    outCircle.fillColor = [UIColor clearColor].CGColor;
    outCircle.strokeColor = color.CGColor;
    outCircle.lineWidth = 1;
    outCircle.strokeEnd = 1.0f;
    
    CAShapeLayer *square = [CAShapeLayer layer];
    CGFloat squareLeftTopX =  view.radius - side/2;
    CGFloat squareLeftTopY =  view.radius - side/2;
    square.path = [UIBezierPath bezierPathWithRect:CGRectMake(squareLeftTopX, squareLeftTopY, side, side)].CGPath;
    square.fillColor = color.CGColor;
    
    
    [view.layer addSublayer:square];
    [view.layer addSublayer:outCircle];
    [view.layer addSublayer:view.progressCircle];
    
    return view;
}

-(void)setProgress:(CGFloat)progress {
    if(progress >= 1.0f) {
        [self.delegate progressViewFinish];
    }
    self.progressCircle.strokeEnd = progress;
}

-(CGFloat)progress {
    return self.progressCircle.strokeEnd;
}


@end
