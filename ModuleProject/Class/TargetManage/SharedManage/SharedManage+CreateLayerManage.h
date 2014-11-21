//
//  SharedManage+CreateLayerManage.h
//  NumberOne
//
//  Created by Zlm on 14-9-2.
//  Copyright (c) 2014年 xmjw. All rights reserved.
//

#import "SharedManage.h"

@interface SharedManage (CreateLayerManage)
-(void)receiveData:(id)sender Protocol:(int)protocol Target:(id)target;
-(id)createLayer:(int)sender;
@end
