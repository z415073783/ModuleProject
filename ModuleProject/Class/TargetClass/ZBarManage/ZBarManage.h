//
//  ZBarManage.h
//  NumberOne
//
//  Created by Zlm on 14-9-2.
//  Copyright (c) 2014年 xmjw. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "ZBarSDK.h"
#import <UIKit/UIKit.h>

@interface ZBarManage : NSObject<ZBarReaderDelegate>
{
    @protected
    UILabel  * label ;
    ZBarReaderView *readerView;
    ZBarCameraSimulator *cameraSim;
    
    
}
@property(nonatomic,retain)UILabel* label;
@property(nonatomic,retain)ZBarReaderView* readerView;

+(ZBarManage*)getInstance;

//二维码扫描  参数:当前界面
-(void)scanning:(id)sender;


@end
