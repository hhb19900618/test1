//
//  testModel.h
//  testBlock
//
//  Created by 华斌 胡 on 15/8/26.
//  Copyright (c) 2015年 华斌 胡. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^executeFinishedBlock)(void);//不带参数的block
typedef void(^executeFinishedBlockParam)(NSString *str);//带参数的block
@interface testModel : NSObject{
     executeFinishedBlock finishblock;
     executeFinishedBlockParam finishblockparam;
}
@property(nonatomic,copy)void (^testBlock)(NSString *str);//属性block
- (void)setExecuteFinished:(executeFinishedBlock)block;
- (void)setExecuteFinishedParam:(executeFinishedBlockParam)block;
- (void)executeTest;
@end
