//
//  ViewController.m
//  circleAnimation
//
//  Created by ccc on 7/15/16.
//  Copyright © 2016 hexjoy. All rights reserved.
//

#import "ViewController.h"
#import "ProgressView.h"

@interface ViewController () <ProgressViewDelegate>
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) ProgressView *pview;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(changeProgress) userInfo:nil repeats:YES];
    
    self.pview = [ProgressView initWithRadius:20.0 side:12.0 color:[UIColor redColor]];
    self.pview.delegate = self;
    [_testView addSubview:self.pview];
    
    
}

-(void)changeProgress {
    NSLog(@"progress %f", self.pview.progress);
   [self.pview addProgress:0.05f];
}

-(void)progressViewFinish {
    NSLog(@"progress view finish");
    [_timer invalidate];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
