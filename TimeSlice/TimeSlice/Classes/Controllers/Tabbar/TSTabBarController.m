//
//  TSTabBarController.m
//  TimeSlice
//
//  Created by zhao tianwei on 2018/4/2.
//  Copyright © 2018年 TimeSlice. All rights reserved.
//

#import "TSTabBarController.h"
#import "TSMIssionViewController.h"
#import "TSArchiveViewController.h"
#import "TSEfficiencyViewController.h"
#import "TSSettingViewController.h"

@interface TSTabBarController ()<UITabBarControllerDelegate>

@end

@implementation TSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    [self initControllers];
    [self.tabBar setBarTintColor:_THEME.tintColor];
}

#pragma mark - Private
- (void)initControllers {
    NSMutableArray *controllers = [NSMutableArray arrayWithCapacity:kTSTabBarItemCount];
    
    TSMIssionViewController *missionController = [[TSMIssionViewController alloc]init];
    UINavigationController *missionNavigationController = [[UINavigationController alloc]initWithRootViewController:missionController];
    missionNavigationController.tabBarItem = [[UITabBarItem alloc]initWithTitle:TSString(@"任务")
                                                                           image:TSImage(@"tabbar_mission_nomal")
                                                                   selectedImage:TSImage(@"tabbar_mission_selected")];
    
    [controllers addObject:missionNavigationController];
    
    TSArchiveViewController *archiveController = [[TSArchiveViewController alloc]init];
    UINavigationController *archiveNavogationController = [[UINavigationController alloc]initWithRootViewController:archiveController];
    archiveNavogationController.tabBarItem = [[UITabBarItem alloc]initWithTitle:TSString(@"归档")
                                                                          image:TSImage(@"tabbar_archive_nomal")
                                                                  selectedImage:TSImage(@"tabbar_archive_selected")];
    [controllers addObject:archiveNavogationController];
    
    TSEfficiencyViewController *efficiencyController = [[TSEfficiencyViewController alloc]init];
    UINavigationController *effciencyNavigationController = [[UINavigationController alloc]initWithRootViewController:efficiencyController];
    effciencyNavigationController.tabBarItem = [[UITabBarItem alloc]initWithTitle:TSString(@"效率")
                                                                            image:TSImage(@"tabbar_efficiency_nomal")
                                                                    selectedImage:TSImage(@"tabbar_efficiency_selected")];
    [controllers addObject:effciencyNavigationController];
    
    TSSettingViewController *settingController = [[TSSettingViewController alloc]init];
    UINavigationController *settingNavigationController = [[UINavigationController alloc]initWithRootViewController:settingController];
    settingNavigationController.tabBarItem = [[UITabBarItem alloc]initWithTitle:TSString(@"设置")
                                                                          image:TSImage(@"tabbar_setting_nomal")
                                                                  selectedImage:TSImage(@"tabbar_setting_selected")];
    [controllers addObject:settingNavigationController];
    [self setViewControllers:controllers];
}

#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
