//
//  RTAddPropertyVC.m
//  RuntimeDemos
//
//  Created by lcx on 2019/12/11.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "RTAddPropertyVC.h"
#import "RuntimeModel+Property.h"

@interface RTAddPropertyVC ()

@end

@implementation RTAddPropertyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    RuntimeModel *runtimeModel = [RuntimeModel new];
    runtimeModel.categoryName = @"categoryName";
    NSLog(@"%@",runtimeModel.categoryName);
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
