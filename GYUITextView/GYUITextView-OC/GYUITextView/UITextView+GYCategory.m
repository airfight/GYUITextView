//
//  UITextView+GYCategory.m
//  GYUITextView
//
//  Created by giant on 16/12/6.
//  Copyright © 2016年 giant. All rights reserved.
//

#import "UITextView+GYCategory.h"

@implementation UITextView (GYCategory)
@dynamic placeholder;
@dynamic placeholder_color;
- (void)setPlaceholder:(NSString *)placeholder
{
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = placeholder;
    placeHolderLabel.numberOfLines = 0;
    [placeHolderLabel sizeToFit];
    placeHolderLabel.textAlignment = NSTextAlignmentJustified;
    placeHolderLabel.font = [UIFont systemFontOfSize:14.0f];
    placeHolderLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:placeHolderLabel];
    NSLog(@"%f",placeHolderLabel.frame.origin.y);
    //UITextView有一个叫做“_placeHolderLabel”的私有变量
    [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    
}

- (void)setPlaceholder_color:(UIColor *)placeholder_color
{
    UILabel *lb = (UILabel *)[self valueForKey:@"_placeholderLabel"];
    lb.textColor = placeholder_color;
}


@end
