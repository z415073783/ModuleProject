//
//  SharedManage.h
//  New_Target
//
//  Created by Zlm on 14-9-1.
//  Copyright (c) 2014年 xmjw. All rights reserved.
//  界面管理与网络管理

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import "NetDataDelegate.h"
#import "MKNetworkKit.h"
//#import "ActivityTouchView.h"
//#import "SharedManageProtocol.h"
typedef NS_ENUM(NSInteger, PushNewLayerType)
{
    PUSHNEWLAYER_PUSH,
    PUSHNEWLAYER_PRESENT,
    PUSHNEWLAYER_PUSH_AND_REMOVETABBAR
    
}PUSHNEWLAYERTYPE;

@interface SharedManage : NSObject<NSURLConnectionDataDelegate>
{

@protected
    UIActivityIndicatorView* activityIndicator;
//    ActivityTouchView* activityView;
}
//@property(nonatomic,assign) id<NetDataDelegate>netDelegate;
//@property(nonatomic,assign) id<SharedManageProtocol>delegate;
@property(nonatomic,assign) id mainLayer;
@property(nonatomic,assign) id keyWindow;
@property(nonatomic,assign) UITabBarController* tabbarController;
@property(nonatomic,assign) id currentLayer;

+(SharedManage*)getInstance;

//推入新界面
-(id)openNewLayer:(int)sender type:(PushNewLayerType)type;
//返回主界面
-(void)popCurrentLayer:(BOOL)action;
-(void)dismissCurrentLayer:(BOOL)action;
//网络请求
-(BOOL)sendMessageWithData:(NSMutableDictionary*)sender DataHead:(NSString*)dataHead Protocol:(int)protocol Target:(id)target Post:(BOOL)post;



@end
