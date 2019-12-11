//
//  DictionaryToModelVC.m
//  RuntimeDemos
//
//  Created by lcx on 2019/12/11.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "DictionaryToModelVC.h"
#import "NSObject+Model.h"
#import "TestModel.h"

@interface DictionaryToModelVC ()

@end

@implementation DictionaryToModelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //字典转模型
    TestModel *testModel = [TestModel modelWithDic:@{@"name":@"li ming",@"isMan":@(YES),@"score":@(100)}];
    NSLog(@"TestModel:name = %@ ,isMan = %d ,score = %d ",testModel.name,testModel.isMan,testModel.score);
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
