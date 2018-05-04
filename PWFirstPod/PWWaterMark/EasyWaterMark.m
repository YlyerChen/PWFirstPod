//
//  EasyWaterMark.m
//  WuYanXiaProject
//
//  Created by Fengwoo on 2018/4/9.
//  Copyright © 2018年 Fengwoo. All rights reserved.
//

#import "EasyWaterMark.h"

@implementation PWWaterMarkConfiguration

+ (PWWaterMarkConfiguration *)defaultConfiguration
{
    PWWaterMarkConfiguration *config = [[PWWaterMarkConfiguration alloc]init];
    config.markBgColor = [UIColor whiteColor];
    config.markTextColor = [UIColor lightGrayColor];
    config.markTextFont = [UIFont systemFontOfSize:20];
    config.markTextInset = UIEdgeInsetsMake(30, 30, 30, 30);
    config.angle = -M_PI_4 * .8;
    return config;
}

@end

@implementation EasyWaterMark

+ (UIColor *)waterMarkColorWithTitle:(NSString *)title configuration:(PWWaterMarkConfiguration *)configuration
{
    UILabel *label = [[UILabel alloc]init];
    label.backgroundColor = configuration.markBgColor;
    label.textColor = configuration.markTextColor;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = title;
    [label sizeToFit];
    label.transform = CGAffineTransformMakeRotation(configuration.angle);
    
    float width = CGRectGetWidth(label.frame) + configuration.markTextInset.left + configuration.markTextInset.right;
    float height = CGRectGetHeight(label.frame) + configuration.markTextInset.top + configuration.markTextInset.bottom;
    
    UIView *labelView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
    labelView.backgroundColor = configuration.markBgColor;
    [labelView addSubview:label];
    
    CGPoint center = labelView.center;
    label.center = center;
    
    UIImage *img = [self makeImageWithView:labelView withSize:labelView.frame.size];
    
    return [UIColor colorWithPatternImage:img];
}

#pragma mark 生成image
+ (UIImage *)makeImageWithView:(UIView *)view withSize:(CGSize)size
{
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了，关键就是第三个参数 [UIScreen mainScreen].scale。
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
