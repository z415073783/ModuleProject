//
//  AdaptiveDeviceManage.h
//  ModuleProject
//
//  Created by Zlm on 14-11-18.
//  Copyright (c) 2014年 xmjw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdaptiveDeviceManage : NSObject
//extern
//全屏拉伸
CGRect ZZRectMakeWithAuto(CGRect sender);
//沿底部高度适配
//static CGRect ZZRectMakeWithFoot(CGRect sender);
//坐标全屏适配
CGPoint ZZPointMakeWithAuto(CGPoint sender);
//坐标沿底部高度适配
CGPoint ZZPointMakeWithFoot(CGPoint sender);
//获取当前设备宽度
+(float)ZZCurrentDeviceWithWidth;
//获取当前设备高度
+(float)ZZCurrentDeviceWithHeight;

@end
