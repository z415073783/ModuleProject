//
//  UserManage.h
//  XiaMenTravel
//
//  Created by Zlm on 14-9-22.
//  Copyright (c) 2014年 xmjw. All rights reserved.
//  用户登录管理

#import <Foundation/Foundation.h>
#import "UserManageProtocol.h"

@interface UserManage : NSObject
{
    @private
    
    BOOL userState;
    
    int userID;
    
//    临时变量
    int operateType;
    
}
@property(retain)NSArray* homeImageList;
@property(retain)NSString* userName;
@property(retain)NSString* zhanghao;
@property(retain)NSString* userPassWord;
@property(retain)NSString* eMail;
//个人登入0,商家登入1
@property(assign)int userType;
@property id<UserManageProtocol>delegate;
//@property id<ChangeWordProtocol>changeWordDelegate;
@property (assign) UIViewController* loginViewC;
@property (nonatomic,assign) int continueLayerTag;
+(UserManage*)GetInstance;
-(BOOL)getLoginState;
-(NSString*)getUserName;
-(NSString*)getPassWord;
-(NSString*)getUserID;
-(BOOL)loginUserWithName:(NSString*)name PassWord:(NSString*)password;
-(void)createUserWithMail:(NSString*)mail Name:(NSString*)name PassWord:(NSString*)password;

-(void)useEditorType:(int)type TradeId:(NSString*)tradeid CaseId:(NSString*)caseid AskId:(NSString*)askid;

//登入帐号
-(BOOL)openLoginLayer;
-(BOOL)ExitUser;

@end
