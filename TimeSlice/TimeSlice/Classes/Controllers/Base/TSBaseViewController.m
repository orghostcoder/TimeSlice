//
//  TSBaseViewController.m
//  TimeSlice
//
//  Created by zhao tianwei on 2018/4/2.
//  Copyright © 2018年 TimeSlice. All rights reserved.
//

#import "TSBaseViewController.h"

@interface TSBaseViewController ()

@end

@implementation TSBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    if (self.navigationController.viewControllers.count > 1) {
        self.navigationItem.leftBarButtonItem = [TSUIComponent backBarButtonItemWithTarget:self
                                                                                     action:@selector(leftBarButtonItemAction:)];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action

- (void)leftBarButtonItemAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
