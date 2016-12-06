//
//  GYUITextView.h
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

@interface GYUITextView : UITextView


/**占位符*/
@property (copy,nonatomic) NSString *placeholder;

@property (copy,nonatomic) UIColor *placeholder_Color;


@property (strong,nonatomic) NSIndexPath *indexPath;

@property (nonatomic,assign) NSInteger maxTextLength;

@property (nonatomic,assign) float updateHeight;


@end
