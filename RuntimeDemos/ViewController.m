//
//  ViewController.m
//  RuntimeDemos
//
//  Created by leichunxiang on 2019/4/17.
//  Copyright © 2019 lcx. All rights reserved.
//

//参考：https://github.com/Tuccuay/RuntimeSummary

#import "ViewController.h"
#import "MessageForwardHeader.h"
#import "GetListHead.h"
#import "RuntimeModel+Property.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self messageForwardTest];
    [self getListTest];
}

#pragma -1 消息转发
- (void)messageForwardTest{
    //对象的方法
    MessageR *messageR = [[MessageR alloc] init];
    [messageR performSelector:@selector(instanceFunction)];
    
    //类方法
    //    [MessageRClass performSelector:@selector(classFunction)];
}

#pragma -2 遍历方法和属性
- (void)getListTest{
    
    //变量
//    [RuntimeHelper printClassIvars:[RuntimeModel class]];

    //属性
    [RuntimeHelper printClassProperties:[RuntimeModel class]];
   
    //实例方法
//    [RuntimeHelper printInstanceMethods:[RuntimeModel class]];
    
    //方法交换
    RuntimeModel *model = [[RuntimeModel alloc] init];
    model.name = @"jack";
    model.sex = @"man";
    NSLog(@"name == %@,sex = %@",model.name,model.sex);
    
    UIImage *image = [UIImage imageNamed:@"picture"];

 
    //类别扩展属性
    model.categoryName = @"cName";
    NSLog(@"\ncName = %@",model.categoryName);
    
    
}


- (void)creatClass{
//Class kClass = objc_alloca
}
@end
