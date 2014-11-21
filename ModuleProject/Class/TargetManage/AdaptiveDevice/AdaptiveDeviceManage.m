//
//  AdaptiveDeviceManage.m
//  ModuleProject
//
//  Created by Zlm on 14-11-18.
//  Copyright (c) 2014年 xmjw. All rights reserved.
//  适配设备策略

#import "AdaptiveDeviceManage.h"

@implementation AdaptiveDeviceManage
//全屏拉伸
CGRect ZZRectMakeWithAuto(CGRect sender)
{
    CGRect newRect = CGRectMake(sender.origin.x*[AdaptiveDeviceManage ZZCurrentDeviceWithWidth]/320, sender.origin.y*[AdaptiveDeviceManage ZZCurrentDeviceWithHeight]/480, sender.size.width*[AdaptiveDeviceManage ZZCurrentDeviceWithWidth]/320, sender.size.height*[AdaptiveDeviceManage ZZCurrentDeviceWithHeight]/480);
    return newRect;
}
//沿底部高度适配
//CGRect ZZRectMakeWithFoot(CGRect sender)
//{
//    CGRect newRect = CGRectMake(sender.origin.x*[AdaptiveDeviceManage ZZCurrentDeviceWithWidth]/320, sender.origin.y*[AdaptiveDeviceManage ZZCurrentDeviceWithHeight]/480, sender.size.width*[AdaptiveDeviceManage ZZCurrentDeviceWithWidth]/320, sender.size.height*[AdaptiveDeviceManage ZZCurrentDeviceWithHeight]/480);
//    return newRect;
//}
//坐标全屏适配
CGPoint ZZPointMakeWithAuto(CGPoint sender)
{
    CGPoint newPoint = CGPointMake(sender.x*[AdaptiveDeviceManage ZZCurrentDeviceWithWidth]/320, sender.y*[AdaptiveDeviceManage ZZCurrentDeviceWithHeight]/480);
    return newPoint;
}
//坐标沿底部高度适配
CGPoint ZZPointMakeWithFoot(CGPoint sender)
{
    CGPoint newPoint = CGPointMake(sender.x*[AdaptiveDeviceManage ZZCurrentDeviceWithWidth]/320, sender.y+[AdaptiveDeviceManage ZZCurrentDeviceWithHeight]-480);
    return newPoint;
}
//获取当前设备宽度
+(float)ZZCurrentDeviceWithWidth
{
    return [UIApplication sharedApplication].keyWindow.frame.size.width;
}
//获取当前设备高度
+(float)ZZCurrentDeviceWithHeight
{
    return [UIApplication sharedApplication].keyWindow.frame.size.height;
}
@end
