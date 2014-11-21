//
//  CustomTabBarControlView.h
//  LeDingNet
//
//  Created by Zlm on 14-11-7.
//  Copyright (c) 2014年 xmjw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomTabBarControlView : NSObject

+(CustomTabBarControlView*)getInstance;
-(void)addCurretnTabBar:(UIView*)view LayerType:(int)layerType;



@end
