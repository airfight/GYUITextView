//
//  GYUITextView.m
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

#import "GYUITextView.h"
//#import <objc/runtime.h>
//#import <objc/message.h>

@implementation GYUITextView 

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}


- (void)initUI{
    
    //_placeholderLabel
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.frame = CGRectMake(5, 2, self.frame.size.width - 10, 20);
    placeHolderLabel.text = self.placeholder;
    placeHolderLabel.numberOfLines = 0;
    if (self.placeholder_Color == nil) {
        placeHolderLabel.textColor = [UIColor lightGrayColor];
    } else {
        placeHolderLabel.textColor = self.placeholder_Color;
    }
    [placeHolderLabel sizeToFit];

    [self addSubview:placeHolderLabel];
    
    //UITextView有一个叫做“_placeHolderLabel”的私有变量 
    [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    
}




@end
