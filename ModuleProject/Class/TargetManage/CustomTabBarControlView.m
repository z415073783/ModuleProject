//
//  CustomTabBarControlView.m
//  LeDingNet
//
//  Created by Zlm on 14-11-7.
//  Copyright (c) 2014年 xmjw. All rights reserved.
//

#import "CustomTabBarControlView.h"
#import "SharedManage.h"
#import "UserManage.h"
@implementation CustomTabBarControlView
+(CustomTabBarControlView*)getInstance
{
    static CustomTabBarControlView* shared = NULL;
    if (shared == NULL)
    {
        shared = [[CustomTabBarControlView alloc]init];
    }
    return shared;
}
-(void)addCurretnTabBar:(UIView*)view LayerType:(int)layerType
{
//    0 Y:363 Width:320 Height:65
    UIView* navigationTopColor = [[UIView alloc]initWithFrame:[WholeDefine ZZRectMakeWithBottonX:0 Y:363 Width:320 Height:65]];
    navigationTopColor.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [view addSubview:navigationTopColor];
    
    UIImageView* backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"UIImage/TabBarImage/TabBar_Background.png"]];
    backgroundView.frame = [WholeDefine ZZRectMakeWithBottonX:0 Y:365 Width:320 Height:49.7];
    [view addSubview:backgroundView];
    //   导航按钮
//    NSArray* navigationArray = @[@"图案",@"裁剪",@"滤镜",@"边框",@"文字"];
    for (int i = 0; i < 5; i++)
    {
        UIButton* zButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [zButton setImage:[UIImage imageNamed:@"UIImage/TabBarImage/TabBar_Icon_Background.png"] forState:UIControlStateSelected];
        zButton.tag = i+10000;
        zButton.frame = [WholeDefine ZZRectMakeWithBottonX:i*64 Y:365 Width:64 Height:50];
        [zButton addTarget:self action:@selector(navigationMethod:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:zButton];
        if (i == layerType)
        {
            //            首次进入的模块
            zButton.selected = YES;
        }
        UIImage* zImage = [UIImage imageNamed:[NSString stringWithFormat:@"UIImage/TabBarImage/TabBar_ICON_%d_0.png",i]];
        UIImageView* titleView = [[UIImageView alloc]initWithImage:zImage];
        titleView.frame = CGRectMake(0, 0, zImage.size.width, zImage.size.height);
        titleView.center = CGPointMake(31.8+i*64, [WholeDefine getWindowSize].size.height-480+389.8);
        [view addSubview:titleView];
        
        
        
        
        
//        UILabel* label = [[UILabel alloc]initWithFrame:[WholeDefine ZZRectMakeWithBottonX:i*64 Y:365 Width:64 Height:50]];
//        label.textAlignment = NSTextAlignmentCenter;
//        label.text = [navigationArray objectAtIndex:i];
//        label.textColor = [UIColor blackColor];
//        label.font = [UIFont fontWithName:TITLEFONT size:18];
//        [view addSubview:label];
    }
    
    
    
//    //   导航按钮
//    for (int i = 0; i < 5; i++)
//    {
//        UIButton* zButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [zButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"UIImage/TabBarImage/TabBar_ICON_%d_0.png",i]] forState:UIControlStateNormal];
//        zButton.tag = i+10;
//        zButton.frame = [WholeDefine ZZRectMakeWithBottonX:i*64 Y:365 Width:64 Height:50];
//        [zButton addTarget:self action:@selector(downButtonSelectMehtod:) forControlEvents:UIControlEventTouchUpInside];
//        [currentView addSubview:zButton];
//    }

}

-(void)navigationMethod:(UIButton*)sender
{
    NSLog(@"%d",sender.tag);
    switch (sender.tag)
    {
        case 10000:
        {
            [[SharedManage getInstance].tabbarController setSelectedIndex:0];
            [SharedManage getInstance].mainLayer = [[SharedManage getInstance].tabbarController selectedViewController];
        }
            break;
        case 10001:
        {
            [[SharedManage getInstance].tabbarController setSelectedIndex:1];
            [SharedManage getInstance].mainLayer = [[SharedManage getInstance].tabbarController selectedViewController];
        }
            break;
        case 10002:
        {
            [[SharedManage getInstance].tabbarController setSelectedIndex:2];
            [SharedManage getInstance].mainLayer = [[SharedManage getInstance].tabbarController selectedViewController];
            
        }
            break;
        case 10003:
        {
            if ([[UserManage GetInstance] openLoginLayer] == NO)
            {
                
                return;
            }
            [[SharedManage getInstance].tabbarController setSelectedIndex:3];
            [SharedManage getInstance].mainLayer = [[SharedManage getInstance].tabbarController selectedViewController];
        }
            break;
        case 10004:
        {
            if ([[UserManage GetInstance] openLoginLayer] == NO)
            {
                
                return;
            }
            [[SharedManage getInstance].tabbarController setSelectedIndex:4];
            [SharedManage getInstance].mainLayer = [[SharedManage getInstance].tabbarController selectedViewController];
        }
            break;
            
        default:
            break;
    }


}
@end
