//
//  MyTabbar.h
//  MyTabbar
//
//  Created by 蔡成汉 on 2017/4/19.
//  Copyright © 2017年 上海泰侠网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyTabbarDelegate;

@interface MyTabbar : UITabBar

/**
 *  my_delegate
 */
@property (nonatomic , weak) id<MyTabbarDelegate>my_delegate;

@end


@protocol MyTabbarDelegate <NSObject>

@optional

/**
 *  中间按钮点击
 *
 *  @param tabbar tabbar
 */
-(void)centerButtonIsTouch:(MyTabbar *)tabbar;

@end
