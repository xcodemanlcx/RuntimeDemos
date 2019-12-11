//
//  ArchiverAndUnarchiverVC.m
//  RuntimeDemos
//
//  Created by lcx on 2019/12/11.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "ArchiverAndUnarchiverVC.h"
#import "ArchiverModel.h"

@interface ArchiverAndUnarchiverVC ()

@end

@implementation ArchiverAndUnarchiverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ArchiverModel *archiverModel = [[ArchiverModel alloc] init];
    archiverModel.name = @"zhang san";
    archiverModel.age  = 18;
    NSString *fileTemp = [NSTemporaryDirectory() stringByAppendingString:@"archiverModel.archive"];
    
    //归档
    //会调用对象的encodeWithCoder方法
    [NSKeyedArchiver archiveRootObject:archiverModel toFile:fileTemp];

    //解档
    ArchiverModel *person = [NSKeyedUnarchiver unarchiveObjectWithFile:fileTemp];
    NSLog(@"path = %@",fileTemp);
    NSLog(@"person: name = %@，age = %d",person.name,person.age);
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
