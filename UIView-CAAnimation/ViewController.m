//
//  ViewController.m
//  UIView-CAAnimation
//
//  Created by Jason on 2017/6/2.
//  Copyright © 2017年 Jason. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CAAnimation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        imageView.image = [UIImage imageNamed:@"test"];
        [self.view addSubview:imageView];
        
        [imageView addCircleMaskAnimation];
    });
}

@end
