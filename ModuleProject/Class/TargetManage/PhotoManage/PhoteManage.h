//
//  PhoteManage.h
//  LeDingNet
//
//  Created by Zlm on 14-11-7.
//  Copyright (c) 2014年 xmjw. All rights reserved.
//  照相与本地相册

#import <Foundation/Foundation.h>
@protocol PhoteDelegate <NSObject>
@optional
-(void)receivePhotoData:(UIImage*)sender;
@end


@interface PhoteManage : NSObject<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImagePickerController* imagePicker;
    
}
@property(assign)id<PhoteDelegate> delegate;
+(PhoteManage*)getInstance;
-(void)openPhoto;
-(void)openCarema;
//合成UIImage
+(UIImage*)createImageFromView:(UIView*)view;
@end
