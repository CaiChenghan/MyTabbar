//
//  MyTabbar.m
//  MyTabbar
//
//  Created by 蔡成汉 on 2017/4/19.
//  Copyright © 2017年 上海泰侠网络科技有限公司. All rights reserved.
//

#import "MyTabbar.h"

@interface MyTabbar ()

/**
 *  按钮
 */
@property (nonatomic , strong) UIButton *myButton;

/**
 *  标题
 */
@property (nonatomic , strong) UILabel *myLabel;

/**
 *  分割线
 */
@property (nonatomic , strong) UIView *line;

@end

@implementation MyTabbar

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initialView];
    }
    return self;
}

-(void)initialView
{
    _line = [[UIView alloc]init];
    [self addSubview:_line];
    
    //按钮
    _myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _myButton.backgroundColor = [UIColor clearColor];
    [_myButton setBackgroundImage:[UIImage imageNamed:@"tw_tabbar_icon_center"] forState:UIControlStateNormal];
    [_myButton setBackgroundImage:[UIImage imageNamed:@"tw_tabbar_icon_center"] forState:UIControlStateHighlighted];
    [_myButton addTarget:self action:@selector(myButtonIsTouch) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_myButton];
    
    //标题
    _myLabel = [[UILabel alloc]init];
    _myLabel.backgroundColor = [UIColor clearColor];
    _myLabel.textColor = [UIColor grayColor];
    _myLabel.textAlignment = NSTextAlignmentCenter;
    _myLabel.font = [UIFont boldSystemFontOfSize:12];
    _myLabel.text = @"探索";
    [self addSubview:_myLabel];
}

-(void)myButtonIsTouch
{
    if ([self.my_delegate respondsToSelector:@selector(centerButtonIsTouch:)])
    {
        [self.my_delegate centerButtonIsTouch:self];
    }
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if (self.hidden == NO)
    {
        if ([self touchPointInsideCircle:_myButton.center radius:30 targetPoint:point]) {
            //如果位于圆形按钮上，则由圆形按钮处理触摸消息
            return _myButton;
        }
        else
        {
            //否则系统默认处理
            return [super hitTest:point withEvent:event];
        }
    }
    return [super hitTest:point withEvent:event];
}

-(BOOL)touchPointInsideCircle:(CGPoint)center radius:(CGFloat)radius targetPoint:(CGPoint)point
{
    CGFloat dist = sqrtf((point.x - center.x) * (point.x - center.x) +
                         (point.y - center.y) * (point.y - center.y));
    return (dist <= radius);
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat tabBarButtonW = (self.width - 80.0)/2;
    
    //设置加号按钮的位置
    CGFloat centerx = self.bounds.size.width * 0.5;
    CGFloat centery = self.bounds.size.height * 0.5;
    _myButton.frame = CGRectMake(centerx - 40.0, centery - 55, 80.0, 80.0);
    
    //设置标题的位置
    _myLabel.frame = CGRectMake((self.width - 80.0)/2.0, self.height - 13.0, 80.0, 12);
    
    _line.frame = CGRectMake(0, 0, self.width, 0.65);
    
    //设置其他tabbarButton的frame
    NSInteger tabBarButtonIndex = 0;
    for (UIView *child in self.subviews)
    {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class])
        {
            // 设置x
            if (tabBarButtonIndex == 0)
            {
                child.left = tabBarButtonIndex * tabBarButtonW;
            }
            else
            {
                child.left = tabBarButtonIndex * tabBarButtonW + 80.0;
            }
            // 设置宽度
            child.width = tabBarButtonW;
            // 增加索引
            tabBarButtonIndex++;
        }
        if ([child isKindOfClass:[UIImageView class]])
        {
            _line.backgroundColor = child.backgroundColor;
            child.hidden = YES;
        }
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
