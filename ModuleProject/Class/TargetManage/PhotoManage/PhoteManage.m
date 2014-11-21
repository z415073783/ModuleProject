//
//  PhoteManage.m
//  LeDingNet
//
//  Created by Zlm on 14-11-7.
//  Copyright (c) 2014年 xmjw. All rights reserved.
//

#import "PhoteManage.h"
#import "SharedManage.h"
@implementation PhoteManage
+(PhoteManage*)getInstance
{
    static PhoteManage* shared = NULL;
    if (shared == NULL)
    {
        shared = [[PhoteManage alloc]init];
    }
    return shared;
}

-(void)openPhoto
{
    //    首先判定相册是否可用
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.delegate = self;
        //        通过模态的形式将整个照片选择器推入,显示在当前window上
        [[SharedManage getInstance].mainLayer presentViewController:imagePicker animated:YES completion:nil];
        
    }
    
//    if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]) {
////        UIImagePickerController * imagePicker = [[UIImagePickerController alloc]init];
//        //        指定imagePicker的获取源为摄像头
//        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
//        //        设置拍照界面的工具栏
//        imagePicker.showsCameraControls = YES;
//        //        设置闪光灯为常亮
//        imagePicker.cameraFlashMode = UIImagePickerControllerCameraFlashModeOn;
//        //        设置照相机模式为拍照模式
//        imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
//        imagePicker.delegate = self;
////        [self presentViewController:imagePicker animated:YES completion:nil];
//        //        通过模态的形式将整个照片选择器推入,显示在当前window上
//        [[SharedManage getInstance].mainLayer presentViewController:imagePicker animated:YES completion:nil];
//    }
}
//点击图片返回
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"%@",[info objectForKey:UIImagePickerControllerOriginalImage]);
    //得到图片
    UIImage * image = [info objectForKey:UIImagePickerControllerOriginalImage];
    //图片存入相册
//    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
   
    UIImage* newImage = [PhoteManage scale:image toSize:CGSizeMake(320, 480)];
    
    
    
    [_delegate receivePhotoData:newImage];
    [[SharedManage getInstance].mainLayer dismissModalViewControllerAnimated:YES];
    
}

//打开相机
-(void)openCarema
{
    //判断是否可以打开相机，模拟器此功能无法使用
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIImagePickerController * picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        picker.allowsEditing = YES;  //是否可编辑
        //摄像头
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [[SharedManage getInstance].mainLayer presentModalViewController:picker animated:YES];
       
    }else{
        //如果没有提示用户
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"你没有摄像头" delegate:nil cancelButtonTitle:@"Drat!" otherButtonTitles:nil];
        [alert show];
    }
}
//打开相机后，然后需要调用UIImagePickerControllerDelegate里的方法，拍摄完成后执行的方法和点击Cancel之后执行的方法：


//点击Cancel按钮后执行方法
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [[SharedManage getInstance].mainLayer dismissModalViewControllerAnimated:YES];
}
//缩小图片尺寸
+(UIImage *)scale:(UIImage *)image toSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
//合成UIImage
+(UIImage*)createImageFromView:(UIView*)view
{
    UIGraphicsBeginImageContext(view.bounds.size);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    

}

@end
