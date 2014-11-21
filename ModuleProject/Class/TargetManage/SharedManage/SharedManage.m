//
//  SharedManage.m
//  New_Target
//
//  Created by Zlm on 14-9-1.
//  Copyright (c) 2014年 xmjw. All rights reserved.
//

#import "SharedManage.h"

#import "SharedManage+CreateLayerManage.h"
#import "SharedManage_Extension.h"
#import "JSON.h"
//#import "WholeDefine.h"
//#import "TestViewController.h"
//#import "FourthViewController.h"
#import "UserManage.h"
@implementation SharedManage
@synthesize mainLayer;
static SharedManage* shared = nil;

+(SharedManage*)getInstance
{
    if(shared == nil)
    {
        shared = [[SharedManage alloc]init];
        
        UIWindow* window = [[UIApplication sharedApplication] keyWindow];
        
        if (!window)
        {
            window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
        }
        shared->activityIndicator = nil;
    }
    return shared;
}

-(id)openNewLayer:(int)sender type:(PushNewLayerType)type
{
    
    UIViewController* newLayer = [self createLayer:sender];

    id pushLayer = newLayer;
  

    switch (type)
    {
        case PUSHNEWLAYER_PUSH:
        {
//            正常推入
            [mainLayer pushViewController:pushLayer animated:TRUE];
        }
            break;
        case PUSHNEWLAYER_PRESENT:
        {
//            present推入
            [mainLayer presentViewController:pushLayer animated:TRUE completion:^{
                
            }];

        }
            break;
        case PUSHNEWLAYER_PUSH_AND_REMOVETABBAR:
        {
//            推入新界面且不带tabbar
            pushLayer = newLayer;
            newLayer.hidesBottomBarWhenPushed = YES;
            [mainLayer pushViewController:pushLayer animated:TRUE];
        }
            break;
            
        default:
            break;
    }
    
    _currentLayer = pushLayer;

    return pushLayer;
}

-(void)popCurrentLayer:(BOOL)action
{
    [mainLayer popToRootViewControllerAnimated:action];
    
}
-(void)dismissCurrentLayer:(BOOL)action
{
    [mainLayer dismissViewControllerAnimated:action completion:^{
        
    }];
}

-(BOOL)sendMessageWithData:(NSMutableDictionary*)sender DataHead:(NSString*)dataHead Protocol:(int)protocol Target:(id)target Post:(BOOL)post
{
    NSMutableString* subData = [NSMutableString stringWithString:IP_Message];
    
    [subData appendFormat:@"%@",dataHead];
    NSLog(@"%@",subData);
    
//    NSMutableString* dataStr = [NSMutableString string];
//    if (sender)
//    {
//        NSArray* allKey = [sender allKeys];
//        
//        for (int i = 0; i<[allKey count]; i++)
//        {
//            if (i == 0 && post == NO)
//            {
//                [dataStr appendFormat:@"?"];
//            }
//            [dataStr appendFormat:@"%@=%@",[allKey objectAtIndex:i],[sender objectForKey:[allKey objectAtIndex:i]]];
//            if (i < [allKey count] - 1)
//            {
//                [dataStr appendString:@"&"];
//            }
//        }
//    }
    
    MKNetworkEngine* engine = [[MKNetworkEngine alloc]initWithHostName:subData customHeaderFields:nil];
    NSLog(@"sendHostName:%@",subData);
    NSLog(@"sendData:%@",sender);
    
    MKNetworkOperation* op;
    if (post == YES)
    {
        op = [engine operationWithURLString:subData params:sender httpMethod:@"POST"];
//        op.postDataEncoding = MKNKPostDataEncodingTypeJSON;
    }else
    {
//        [subData appendString:dataStr];
        op = [engine operationWithURLString:subData params:sender httpMethod:@"GET"];
    }
    
//用户登录
//    if ([[UserManage GetInstance] getLoginState] == YES)
//    {
//        [op setUsername:[[UserManage GetInstance]  getUserName] password:[[UserManage GetInstance] getPassWord] basicAuth:YES];
//    }
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSLog(@"netData:\n%@",[completedOperation responseJSON]);
        
        [self receiveData:[completedOperation responseJSON] Protocol:protocol Target:target];
        
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"error:%@",error);
    }];
    
    [engine enqueueOperation:op];

    return TRUE;
}

-(id)readLocalData:(NSString*)filePath
{
    
    NSString* path = [[NSBundle mainBundle] pathForResource:filePath ofType:@"json"];
    NSData* jData = [[NSData alloc]initWithContentsOfFile:path];
    NSLog(@"leng:%d",[jData length]);
    
    NSError* error = nil;
    id aData = [NSJSONSerialization JSONObjectWithData:jData options:kNilOptions error:&error];
    NSLog(@"%@",aData);
    
    return aData;
}
//开始转风火轮
//-(void)activityViewBegin
//{
//    
//    if (activityIndicator == NULL)
//    {
////        [activityIndicator removeFromSuperview];
//        activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//        activityIndicator.frame = CGRectMake(0, 0, 24, 24);
//        activityIndicator.center = ((UIViewController*)mainLayer).view.center;
//        [((UIViewController*)mainLayer).view addSubview:activityIndicator];
//        
//    }
//    [activityIndicator startAnimating];
//    
//    if (activityView == NULL)
//    {
////        [activityView removeFromSuperview];
////        activityView = nil;
//        activityView = [[ActivityTouchView alloc]init];
//        [((UIViewController*)mainLayer).view addSubview:activityView];
//    }
//    
// 
//}
////停止风火轮
//-(void)activityViewStop
//{
//    [activityIndicator stopAnimating];
//    [activityView removeFromSuperview];
//    activityView = nil;
//}

@end
