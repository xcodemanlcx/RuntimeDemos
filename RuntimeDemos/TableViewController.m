//
//  TableViewController.m
//  LCXUIInit
//
//  Created by leichunxiang on 2019/9/2.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "TableViewController.h"

static NSString * const kCellReuseIdentifier = @"CellReuseIdentifier";

@interface TableViewController ()

@end

@implementation TableViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"Examples";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:kCellReuseIdentifier];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _exampleControllerNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier forIndexPath:indexPath];
    NSString *viewControllerName = _exampleControllerNames[indexPath.row];
    cell.backgroundColor = [UIColor orangeColor];
    cell.textLabel.text = viewControllerName;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *viewControllerName = _exampleControllerNames[indexPath.row];
    Class viewControllerClass = NSClassFromString(viewControllerName);
    [self.navigationController pushViewController:viewControllerClass.new  animated:YES];
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
