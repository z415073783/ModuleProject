//
//  UserManage.m
//  XiaMenTravel
//
//  Created by Zlm on 14-9-22.
//  Copyright (c) 2014年 xmjw. All rights reserved.
//

#import "UserManage.h"
#import "SharedManage.h"
#import "SharedManage_Extension.h"
//#import "LoginViewController.h"
//#import "ExampleDataManage.h"
//#import "LoginViewController.h"
@implementation UserManage
+(UserManage*)GetInstance
{
    static UserManage* shared = nil;
    if (shared == nil)
    {
        shared = [[UserManage alloc]init];
//        [SharedManage getInstance].netDelegate = shared;
        shared.continueLayerTag = 0;
        shared.userType = 0;
        
    }
    
    return shared;
}

-(void)changePassWord:(NSString *)newPassWord
{
//    [SharedManage getInstance].netDelegate = self;
    
}
-(void)changeUserManage:(NSString *)zname Sex:(NSString *)zsex Phone:(NSString *)ztelePhone
{
    
//    [SharedManage getInstance].netDelegate = self;
}
/*
-(void)receiveNetData:(id)data Protocol:(int)protocol
{
    switch (protocol)
    {
        case NetData_LoginNameTag:
            NSLog(@"帐号登录%@",data);
            
            if ([[data objectForKey:@"code"] intValue] == 1000)
            {
                [_delegate loginStateMethod:YES  Data:data];
                userState = YES;
                userID = [[data objectForKey:@"UserID"] intValue];
                _userName = [data objectForKey:@"userName"];
                
                [[NSUserDefaults standardUserDefaults] setObject:_zhanghao forKey:@"userName"];
                [[NSUserDefaults standardUserDefaults] setObject:_userPassWord forKey:@"passWord"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d",_userType] forKey:@"userType"];

            }else
            {
                [_delegate loginStateMethod:NO  Data:data];
                
               userState = NO;
            }
            
        
            break;
            
        case NetData_CreateNameTag:
            
            NSLog(@"帐号创建:%@",data);
            [_delegate createUserData:data];
//            if([[data objectForKey:@"code"] integerValue]==1000)
//            {
//                
//                userState = YES;
//                _userType = 0;
//                userID = [[data objectForKey:@"UserID"] intValue];
//                _userName = [data objectForKey:@"Nickname"];
//            }else
//            {
//                userState = NO;
//            }
        
            break;
//        case NetData_UseEditorTag:
//        {
//             UIViewController* mainlayer = [SharedManage getInstance].mainLayer;
//            if ([[data objectForKey:@"code"] intValue] == 1000)
//            {
//                NSString* str;
//                if (operateType == 1)
//                {
//                    [[ExampleDataManage getInstance] addAppointNumber:operateType];
//                    
//                    
//                    str = @"预约成功";
//                }else if(operateType == 0)
//                {
//                    [[ExampleDataManage getInstance] addAppointNumber:operateType];
//                    
//                    str = @"收藏成功";
//                }else if (operateType == 2)
//                {
//                    str = @"关注成功";
//                }else if (operateType == 3)
//                {
//                    str = @"收藏成功";
//                }
//                
//                [WholeDefine addAlertViewWithTitle:str Target:mainlayer.view];
//                
//            }else if([[data objectForKey:@"code"] intValue] == 1003)
//            {
//                NSString* str;
//                if (operateType == 1)
//                {
//                    str = @"已预约";
//                }else if(operateType == 0)
//                {
//                    str = @"已收藏";
//                }else if (operateType == 2)
//                {
//                    str = @"已关注";
//                }else if (operateType == 3)
//                {
//                    str = @"已收藏";
//                }
//                [WholeDefine addAlertViewWithTitle:str Target:mainlayer.view];
//            }else
//            {
//                
//                [WholeDefine addAlertViewWithTitle:@"操作失败!" Target:mainlayer.view];
//            }
//        }
//            break;

        default:
            break;
    }

}
 */

/*
-(void)createUserWithMail:(NSString*)mail Name:(NSString*)name PassWord:(NSString*)password
{
    NSMutableDictionary* dic = [NSMutableDictionary dictionary];
//    [dic setValue:mail forKey:@"email"];
    [dic setValue:name forKey:@"username"];
    [dic setValue:password forKey:@"password"];
    [[SharedManage getInstance] sendMessageWithData:dic DataHead:@"application/UserInfo/registUser" Protocol:NetData_CreateNameTag Target:self Post:YES];
}
 */

-(BOOL)getLoginState
{
    return userState;
}
-(NSString*)getUserName
{
    if (userState == YES)
    {
        return _userName;
    }
    return nil;
}
-(NSString*)getPassWord
{
    if (userState == YES)
    {
        return _userPassWord;
    }
    return nil;
}
-(NSString *)getUserID
{
    return [NSString stringWithFormat:@"%d",userID];
}
/*
-(BOOL)loginUserWithName:(NSString *)name PassWord:(NSString *)password
{
    if (userState == YES)
    {
        [_delegate loginStateMethod:YES Data:nil];
    }else
    {
        NSMutableDictionary* dic = [NSMutableDictionary dictionary];
        [dic setValue:name forKey:@"username"];
        [dic setValue:password forKey:@"password"];
        _zhanghao = name;
        _userPassWord = password;
        if (_userType == 0)
        {
            [[SharedManage getInstance] sendMessageWithData:dic DataHead:@"application/UserInfo/userLoginIn" Protocol:NetData_LoginNameTag Target:self Post:YES];
        }else
        {
            [[SharedManage getInstance] sendMessageWithData:dic DataHead:@"application/Business/BusinessLoginIn" Protocol:NetData_LoginNameTag Target:self Post:YES];
        }
    }
    
    return YES;
}
*/
/*
-(void)useEditorType:(int)type TradeId:(NSString*)tradeid CaseId:(NSString*)caseid AskId:(NSString*)askid
{
    if ([[UserManage GetInstance] openLoginLayer] == NO)
    {
        return;
    }
    
    
    if (_userType == 1)
    {
        [WholeDefine addAlertViewWithTitle:@"商家无权限进行该操作" Target:((UIViewController*)[SharedManage getInstance].mainLayer).view];
        
        
        
        return;
    }
    
    [[ExampleDataManage getInstance] setSelectExample:caseid];
    
    
    NSMutableDictionary* dic = [NSMutableDictionary dictionary];
    operateType = type;
    [dic setValue:[NSString stringWithFormat:@"%d",type] forKey:@"operatetype"];
    [dic setValue:tradeid forKey:@"tradeid"];
    [dic setValue:caseid forKey:@"caseid"];
    [dic setValue:askid forKey:@"askid"];
    
    [SharedManage getInstance].netDelegate = self;
    [[SharedManage getInstance]sendMessageWithData:dic DataHead:@"application/UserOperate/UserHandler" Protocol:NetData_UseEditorTag Target:self Post:YES];
    
    
}
 */

//登入帐号
/*
-(BOOL)openLoginLayer
{
    if (userState == YES)
    {
        return YES;
    }else
    {
      
        id newLayer = [[SharedManage getInstance] openNewLayer:LoginViewControllerTag type:PUSHNEWLAYER_PUSH_AND_REMOVETABBAR isNavigation:NO];
        [newLayer initData];
        
        return NO;
    }
}
 */
-(BOOL)ExitUser
{
    
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"userName"];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"passWord"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"userType"];
    _userName = nil;
    _userPassWord = nil;
    userState = NO;
    userID = 0;
    _userType = 0;
    
    return YES;
}

@end
