//
//  UITextView+GYCategory.h
//  GYUITextView
//
//  Created by ZGY on 16/12/3.
//  Copyright © 2016年 giant. All rights reserved.
//
//  Author:        Airfight
//  My GitHub:     https://github.com/airfight
//  My Blog:       http://airfight.github.io/
//  My Jane book:  http://www.jianshu.com/users/17d6a01e3361
//  Current Time:  16/12/3  下午2:52
//  GiantForJade:  Efforts to do my best
//  Real developers ship.

#import <UIKit/UIKit.h>

@interface UITextView (GYCategory)

/**占位符*/
@property (copy,nonatomic) NSString *placeholder;

/**
 占位符的字体大小
 */
@property (nonatomic,strong) UIFont *placeholder_font;

/**
 占位符字体颜色
 */
@property (nonatomic,strong) UIColor *placeholder_color;

/**
 自动增长
 */
@property (nonatomic,assign) BOOL isAutoHeight;


/**
 最高增长高度 成员变量
 */
@property (nonatomic,assign) CGFloat maxAutoHeight;


@end
