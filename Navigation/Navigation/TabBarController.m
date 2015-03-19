//
//  TabBarController.m
//  Navigation
//
//  Created by Vivian Chiodo Dias on 18/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "TabBarController.h"
#import "DicionarioViewController.h"
#import "TableViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    DicionarioViewController *viewController = [[DicionarioViewController alloc]
                                                initWithNibName:nil
                                                bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    TableViewController *table = [[TableViewController alloc] init];
    
    NSArray *views = [[NSArray alloc] initWithObjects:nav, table, nil];
    [self setViewControllers:views];
    
    nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"A, B, C" image:nil tag:1];
    table.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"Lista" image:nil tag:2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
