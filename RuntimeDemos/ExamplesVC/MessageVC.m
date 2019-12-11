//
//  MessageVC.m
//  RuntimeDemos
//
//  Created by lcx on 2019/12/11.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "MessageVC.h"
//参考：https://www.jianshu.com/p/fe131f8757ba

@interface MessageVC ()

@end

@implementation MessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //利用消息机制，提高某一方法频繁调用的效率
    void (*setter)(id, SEL, int);
    setter = (void (*)(id, SEL, int))[self methodForSelector:@selector(setAge:)];
    for (int i = 0 ; i < 100 ; i++ )
        setter(self, @selector(setAge:), i);
}

- (void)setAge:(int)age{
    NSLog(@"setAge = %d",age);
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
