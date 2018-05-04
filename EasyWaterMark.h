//
//  EasyWaterMark.h
//  WuYanXiaProject
//
//  Created by Fengwoo on 2018/4/9.
//  Copyright © 2018年 Fengwoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PWWaterMarkConfiguration : NSObject

+ (PWWaterMarkConfiguration *)defaultConfiguration;

@property (nonatomic, strong) UIColor *markBgColor;/**< 水印的背景颜色*/
@property (nonatomic, strong) UIColor *markTextColor;/**< 水印的文字颜色*/
@property (nonatomic, strong) UIFont *markTextFont;/**< 水印文字的大小*/
@property (nonatomic) UIEdgeInsets markTextInset;/**< 单位文字的边距*/
@property (nonatomic) CGFloat angle;/**< 文字旋转角度*/

@end

@interface EasyWaterMark : NSObject

+ (UIColor *)waterMarkColorWithTitle:(NSString *)title configuration:(PWWaterMarkConfiguration *)configuration;

@end
