//
//  BaseViewController.h
//  ModuleProject
//
//  Created by Zlm on 14-11-18.
//  Copyright (c) 2014年 xmjw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
{
    
    
    
}

//设置一个统一格式的标题
-(void)setNavigationWithTitle:(NSString*)title Color:(UIColor*)color;
//添加导航栏左侧按钮(默认样式)
-(void)setReturnButtonWithDefault;
//设置导航栏左侧按钮(自定义图片和触发方法)
-(void)addLeftButtonWithImagePath:(NSString*)path Action:(SEL)action;
//设置导航栏右侧按钮(自定义图片和触发方法)
-(void)setRightButtonWithImagePath:(NSString*)imagePath Action:(SEL)ation;
//设置导航栏右侧按钮(自定义文字和触发方法)
-(void)setRightButtonWithTitle:(NSString*)title action:(SEL)action;

@end
