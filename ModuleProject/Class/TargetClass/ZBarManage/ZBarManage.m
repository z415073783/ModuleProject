//
//  ZBarManage.m
//  NumberOne
//
//  Created by Zlm on 14-9-2.
//  Copyright (c) 2014年 xmjw. All rights reserved.
//

#import "ZBarManage.h"

@implementation ZBarManage
@synthesize readerView;
@synthesize label;

+(ZBarManage *)getInstance
{
    static ZBarManage* shared = nil;
    if (shared == nil)
    {
        shared = [[ZBarManage alloc]init];
        [ZBarReaderView class];
    }
    return shared;
}


-(void)scanning:(id)sender
{
    NSLog(@"二维码扫描.........");
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = reader.scanner;
    
    [scanner setSymbology:ZBAR_I25 config:ZBAR_CFG_ENABLE to:0];
    
    [sender presentViewController:reader animated:YES completion:^{
        NSLog(@"跳转成功");
        
    }];
}

@end
