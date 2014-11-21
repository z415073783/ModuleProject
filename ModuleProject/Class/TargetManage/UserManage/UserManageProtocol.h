//
//  UserManageProtocol.h
//  XiaMenTravel
//
//  Created by Zlm on 14-9-22.
//  Copyright (c) 2014年 xmjw. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UserManageProtocol <NSObject>
@optional

-(void)loginStateMethod:(BOOL)state Data:(NSDictionary*)dic;

-(void)createUserData:(id)data;

-(void)changeUserManage:(BOOL)sender;

-(void)isEditorState:(BOOL)sender;

@end
