//
//  UITextView+GYCategory.m
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

#import "UITextView+GYCategory.h"
#import <objc/runtime.h>

static const void *GYCategoryKey = &GYCategoryKey;
@implementation UITextView (GYCategory)

@dynamic placeholder;
@dynamic placeholder_color;
@dynamic placeholder_font;
@dynamic isAutoHeight;
@dynamic maxAutoHeight;

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


-(void)setPlaceholder_font:(UIFont *)placeholder_font
{
    UILabel *lb = (UILabel *)[self valueForKey:@"_placeholderLabel"];
    lb.font = placeholder_font;
}

- (void)setPlaceholder_color:(UIColor *)placeholder_color
{
    UILabel *lb = (UILabel *)[self valueForKey:@"_placeholderLabel"];
    lb.textColor = placeholder_color;
}

- (void)setIsAutoHeight:(BOOL)isAutoHeight
{
    [self setNeedsLayout];
}

- (CGFloat)maxAutoHeight
{
    return [objc_getAssociatedObject(self, GYCategoryKey) floatValue];
}

- (void)setMaxAutoHeight:(CGFloat)maxAutoHeight
{
    objc_setAssociatedObject(self,GYCategoryKey,@(maxAutoHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.scrollIndicatorInsets = UIEdgeInsetsZero;
    CGRect textFrame = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width-10,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName, nil] context:nil];
    
    if (textFrame.size.height > self.frame.size.height &&  self.maxAutoHeight > textFrame.size.height) {
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, textFrame.size.height);
        return;
    }
    
    
    if (textFrame.size.height < self.frame.size.height && 30 < textFrame.size.height) {
       self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, textFrame.size.height + 10);
    }

}


@end
