//
//  MailVC.m
//  线程基础
//
//  Created by 李泽平 on 2018/7/13.
//  Copyright © 2018年 李泽平. All rights reserved.
//

#import "MailVC.h"
#import "Demo.h"

@interface MailVC ()

@property (nonatomic, strong) NSMutableArray *aryData;

@end

@implementation MailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"线程基础"];
    self.aryData = [[NSMutableArray alloc] init];
    [self.aryData addObject:@"pthread"];
    [self.aryData addObject:@"NSThreadVC"];
    [self.aryData addObject:@"线程状态"];
    [self.aryData addObject:@"NSTread属性"];
    [self.aryData addObject:@"资源共享"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.aryData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.aryData[indexPath.row];
    return cell;

    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"One"] animated:YES];
    }
    if (indexPath.row == 1) {
        [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Two"] animated:YES];
    }
    if (indexPath.row == 2) {
        [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Three"] animated:YES];
    }
    if (indexPath.row == 3) {
        [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Four"] animated:YES];
    }
    if (indexPath.row == 4) {
        [self.navigationController pushViewController:[[Demo alloc] init] animated:YES];
    }
}


@end
