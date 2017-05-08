//
//  ViewController.m
//  CALayer
//
//  Created by 1134 on 2017/5/8.
//  Copyright © 2017年 1134. All rights reserved.
//

#import "ViewController.h"
//#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

/*
 * 第一步先在Target->General
 * ->Linked framework and library
 * 加入QuartzCore.framework
 * Note: 經過測試，
 * 沒有在ViewController 
 * import <QuartzCore/QuartzCore.h> framework
 * 依然正常執行
 */

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self setCornerRadiousLayer];
    
    //[self setShadowLayer];
    
    [self setImageCornerRadiousAndShadow];
}

/*
 * 設置圖片圓角
 */
-(void)setCornerRadiousLayer
{
    UIImage *image = [UIImage imageNamed:@"intro"];
    float ratio = image.size.width/image.size.height;
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(10, 50, 200, 200/ratio);
    //不轉成CGImage則無法顯示出來
    layer.contents = (id)image.CGImage;
    layer.cornerRadius = 20.0;
    layer.masksToBounds = YES;
    [self.view.layer addSublayer:layer];
}

/*
 * 設置陰影
 */
-(void)setShadowLayer
{
    UIImage *image = [UIImage imageNamed:@"intro"];
    float ratio = image.size.width/image.size.height;
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(10, 50, 200, 200/ratio);
    layer.contents = (id)image.CGImage;
    layer.shadowColor = [UIColor blackColor].CGColor;
    //layer向右下角偏移10 pixel
    layer.shadowOffset = CGSizeMake(10, 10);
    //陰影透明度
    layer.shadowOpacity = 0.8;
    //陰影圓角
    layer.shadowRadius = 5.0;
    [self.view.layer addSublayer:layer];
}

/*
 * 設置view的圓角 且有陰影
 */
-(void)setImageCornerRadiousAndShadow
{
    UIImage *image = [UIImage imageNamed:@"intro"];
    float ratio = image.size.width/image.size.height;
    
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(10, 50, 300, 200/ratio)];
    contentView.layer.frame = CGRectMake(10, 50, 200, 200/ratio);
    contentView.layer.contents = (id)image.CGImage;
    contentView.layer.cornerRadius = 20.0;
    contentView.layer.masksToBounds = YES;
    
    
    CALayer *layer = [CALayer layer];
    layer.frame = contentView.frame;
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOffset = CGSizeMake(10, 10);
    layer.shadowOpacity = 0.8;
    layer.masksToBounds = NO;
    layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:contentView.bounds cornerRadius:20.0] CGPath];
    
    
    [self.view.layer addSublayer:layer];
    [self.view addSubview:contentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
