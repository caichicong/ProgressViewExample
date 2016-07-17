//
//  ProgressView.h
//  circleAnimation
//
//  Created by ccc on 7/16/16.
//  Copyright © 2016 hexjoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProgressViewDelegate <NSObject>
@required
-(void)progressViewFinish;
@end

@interface ProgressView : UIView

@property (weak, nonatomic) id<ProgressViewDelegate> delegate;

+ (ProgressView *)initWithRadius:(CGFloat)radius side:(CGFloat)side color:(UIColor *)color;
-(void)setProgress:(CGFloat)progress;
-(CGFloat)progress;
@end


