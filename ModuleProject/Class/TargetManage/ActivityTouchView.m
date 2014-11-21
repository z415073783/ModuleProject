//
//  ActivityTouchView.m
//  XiaMenTravel
//
//  Created by Zlm on 14-10-11.
//  Copyright (c) 2014年 xmjw. All rights reserved.
//

#import "ActivityTouchView.h"

@implementation ActivityTouchView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)init
{
    self = [super initWithFrame:[[UIApplication sharedApplication] keyWindow].frame];
    if (self)
    {
        NSLog(@"-----1");
    }
    return self;
}
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    
    
    return [[UIApplication sharedApplication] keyWindow];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
