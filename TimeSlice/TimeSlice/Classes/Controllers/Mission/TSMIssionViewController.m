//
//  TSMIssionViewController.m
//  TimeSlice
//
//  Created by zhao tianwei on 2018/4/2.
//  Copyright © 2018年 TimeSlice. All rights reserved.
//

#import "TSMIssionViewController.h"

@interface TSMIssionViewController ()

@end

@implementation TSMIssionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"任务";
    self.navigationItem.rightBarButtonItem = [TSUIComponent newBarButtonItemWithTarget:self action:@selector(newMission)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private
- (void)newMission {
    NSDictionary *params = @{@"navigationController": self.navigationController};
    [[TSTaskMediator sharedInstance]performTargetWithURL:[NSURL URLWithString:@"route://Router/pushToPage?module=newMission"] params:params shouldCacheTarget:YES];
}



@end
