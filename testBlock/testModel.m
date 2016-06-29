//
//  testModel.m
//  testBlock
//
//  Created by 华斌 胡 on 15/8/26.
//  Copyright (c) 2015年 华斌 胡. All rights reserved.
//

#import "testModel.h"

@implementation testModel

-(id)init{
    self=[super init];
    if (self) {
//        self.testBlock(@"str");
    }
    return self;
}

-(void)setExecuteFinished:(executeFinishedBlock)block{
    finishblock=block;
//    OBJC_RELEASE(finishblock);
//    finishblock = OBJC_COPY(block); //在非ARC下这里不能使用retain
}

- (void)setExecuteFinishedParam:(executeFinishedBlockParam)block
{
    finishblockparam=block;
//    OBJC_RELEASE(finishblockparam);
//    finishblockparam = OBJC_COPY(block); //在非ARC下这里不能使用retain
}

- (void)executeTest
{
    [self performSelector:@selector(executeCallBack) withObject:nil afterDelay:1];
}

- (void)executeCallBack
{
//    _resultCode = 200;
    
    if (finishblock)
    {
        finishblock();//调用block
    }
    if (finishblockparam)
    {
        finishblockparam(@"我带参数");
    }
}

@end
