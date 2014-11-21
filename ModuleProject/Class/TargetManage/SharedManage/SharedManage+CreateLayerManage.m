//
//  SharedManage+CreateLayerManage.m
//  NumberOne
//
//  Created by Zlm on 14-9-2.
//  Copyright (c) 2014年 xmjw. All rights reserved.
//

#import "SharedManage+CreateLayerManage.h"
#import "SharedManage_Extension.h"
#import "JSON.h"

//#import "FirstViewController.h"


@implementation SharedManage (CreateLayerManage)

-(id)createLayer:(int)sender
{
    id currentLayer = nil;
    switch (sender)
    {
//        case FirstViewControllerTag:
//        {
//            currentLayer = [[FirstViewController alloc]init];
//
//        }
//            break;
        default:
            break;
    }
    return currentLayer;
}
//网络数据返回
-(void)receiveData:(id)sender Protocol:(int)protocol Target:(id)target
{
    id netDic = sender;
    switch (protocol)
    {
//        case NetData_DIYProduceListTag:
//        {
//            [(RecommendViewController*)target receiveNetData:netDic Protocol:protocol];
//        }
//            break;
        default:
            [target performSelector:@selector(receiveNetData:Protocol:) withObject:netDic withObject:[NSString stringWithFormat:@"%d",protocol]];
            break;
    }
}
@end
