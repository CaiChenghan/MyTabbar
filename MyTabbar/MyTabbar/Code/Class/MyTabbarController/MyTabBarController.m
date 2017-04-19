//
//  MyTabBarController.m
//  MyPlayer
//
//  Created by 蔡成汉 on 2017/4/6.
//  Copyright © 2017年 上海泰侠网络科技有限公司. All rights reserved.
//

#import "MyTabBarController.h"
#import "HomeViewController.h"
#import "HotViewController.h"
#import "MyViewController.h"
#import "MyTabbar.h"

@interface MyTabBarController ()<MyTabbarDelegate>

@property (nonatomic , strong) MyTabbar *myTabbar;

@end

@implementation MyTabBarController

-(BOOL)shouldAutorotate{
    UINavigationController *nav = self.viewControllers[self.selectedIndex];
    return [nav.visibleViewController shouldAutorotate];
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    UINavigationController *nav = self.viewControllers[self.selectedIndex];
    return [nav.visibleViewController supportedInterfaceOrientations];
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    UINavigationController *nav = self.viewControllers[self.selectedIndex];
    return [nav.visibleViewController preferredInterfaceOrientationForPresentation];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //reset tabbar
    _myTabbar = [[MyTabbar alloc]init];
    _myTabbar.my_delegate = self;
    _myTabbar.backgroundColor = [UIColor whiteColor];
    _myTabbar.translucent = NO;
    [self setValue:_myTabbar forKey:@"tabBar"];
    
    //add controller
    HomeViewController *homeViewController = [[HomeViewController alloc]init];
    MyNavigationController *homeNav = [[MyNavigationController alloc]initWithRootViewController:homeViewController];
    homeNav.title = @"首页";
    homeNav.tabBarItem.image = [[UIImage imageNamed:@"tw_tabbar_icon_01_u"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"tw_tabbar_icon_01_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    MyViewController *myViewController = [[MyViewController alloc]init];
    MyNavigationController *myNav = [[MyNavigationController alloc]initWithRootViewController:myViewController];
    myNav.title = @"我";
    myNav.tabBarItem.image = [[UIImage imageNamed:@"tw_tabbar_icon_02_u"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myNav.tabBarItem.selectedImage = [[UIImage imageNamed:@"tw_tabbar_icon_02_s"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.viewControllers = @[homeNav,myNav];
}

#pragma mark - MyTabbarDelegate

-(void)centerButtonIsTouch:(MyTabbar *)tabbar{
    HotViewController *controller = [[HotViewController alloc]init];
    MyNavigationController *navgationController = [[MyNavigationController alloc]initWithRootViewController:controller];
    [self presentViewController:navgationController animated:YES completion:nil];
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
