//
//  MessageForwardVC.m
//  RuntimeDemos
//
//  Created by lcx on 2019/12/11.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "MessageForwardVC.h"

//参考：https://www.jianshu.com/p/fdd8f5225f0c
#import "MessageR.h"
#import "ClassMessageR.h"
#import "StatusManager.h"

@implementation MessageForwardVC

- (void)viewDidLoad{
    [super viewDidLoad];

    /**
     1、messageStatus:1 动态方法解析；2 备用接受者；3 完整转发；
     2、方法缓存：例如，动态添加的方法系统会缓存，下次就不会再走消息转发了。
     */
    int messageStatus = 3;
    [StatusManager shareInstance].status = messageStatus;
    BOOL isInstanceMessageForward = NO;
    if (isInstanceMessageForward) {
        //实例方法消息转发
             [MessageR.new performSelector:NSSelectorFromString(kInstanceFun)];

    }else{
        //类方法消息转发
        [ClassMessageR performSelector:NSSelectorFromString(kClassFun)];
    }
}

@end
