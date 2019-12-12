//
//  MessageVC.m
//  RuntimeDemos
//
//  Created by lcx on 2019/12/11.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "MessageVC.h"
#import <objc/message.h>

//参考：https://www.jianshu.com/p/fe131f8757ba

@interface MessageModel :NSObject

- (void)setAge:(int )age;

@end

@implementation MessageModel

- (void)setAge:(int )age{
    NSLog(@"%@ : age = %d",self,age);
}

@end

@interface MessageVC ()

@end

@implementation MessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //1 消息发送
    ((void (*)(id, SEL, int))objc_msgSend)(MessageModel.new, @selector(setAge:), 100);
    
    //2 缓存IMP，提高某一方法频繁调用效率
    MessageModel *messageModel = MessageModel.new;
    IMP nameIMP = class_getMethodImplementation(object_getClass(messageModel), @selector(setAge:));
    void (*setter)(id, SEL, int) = (void *)nameIMP;
    for (int i = 0; i < 10; i++) {
        setter(messageModel,@selector(setAge:),i);
    }

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end



