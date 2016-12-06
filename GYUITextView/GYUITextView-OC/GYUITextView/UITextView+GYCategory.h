//
//  UITextView+GYCategory.h
//  GYUITextView
//
//  Created by giant on 16/12/6.
//  Copyright © 2016年 giant. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (GYCategory)

/**占位符*/
@property (copy,nonatomic) NSString *placeholder;


/**
 占位符字体颜色
 */
@property (nonatomic,strong) UIColor *placeholder_color;


@end
