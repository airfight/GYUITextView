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

static const void *GYMaxAutoHeight = &GYMaxAutoHeight;
static const void *GYMinAutoHeight = &GYMinAutoHeight;
static const void *GYIsAutoBool  = &GYIsAutoBool;
static const void *GYplaceholder_font  = &GYplaceholder_font;
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
    placeHolderLabel.textColor = [UIColor lightGrayColor];
    placeHolderLabel.frame = CGRectMake(5,self.textContainerInset.top, self.frame.size.width - 10,self.frame.size.height);
    placeHolderLabel.contentMode = UIViewContentModeTopLeft;
    placeHolderLabel.numberOfLines = 0;
    [self addSubview:placeHolderLabel];

    [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    
    self.enablesReturnKeyAutomatically = YES;
    self.scrollsToTop = NO;

}


-(void)setPlaceholder_font:(UIFont *)placeholder_font
{
    objc_setAssociatedObject(self,GYplaceholder_font,placeholder_font,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    UILabel *lb = (UILabel *)[self valueForKey:@"_placeholderLabel"];
    lb.font = placeholder_font;
    [lb sizeToFit];
}

- (UIFont *)placeholder_font
{
  
     return (UIFont *)objc_getAssociatedObject(self, GYplaceholder_font) ;
}

- (void)setPlaceholder_color:(UIColor *)placeholder_color
{
    UILabel *lb = (UILabel *)[self valueForKey:@"_placeholderLabel"];
    lb.textColor = placeholder_color;
}

- (BOOL)isAutoHeight
{
    return [objc_getAssociatedObject(self, GYIsAutoBool) boolValue];
}

- (void)setIsAutoHeight:(BOOL)isAutoHeight
{
    [self setNeedsLayout];
    objc_setAssociatedObject(self,GYIsAutoBool,@(isAutoHeight),OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)maxAutoHeight
{
    return [objc_getAssociatedObject(self, GYMaxAutoHeight) floatValue];
}

- (void)setMaxAutoHeight:(CGFloat)maxAutoHeight
{
    objc_setAssociatedObject(self,GYMaxAutoHeight,@(maxAutoHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)minAutoHeight
{
    return [objc_getAssociatedObject(self, GYMinAutoHeight) floatValue];
}

- (void)setMinAutoHeight:(CGFloat)minAutoHeight
{

    objc_setAssociatedObject(self,GYMinAutoHeight,@(minAutoHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.superview layoutSubviews];
    self.scrollIndicatorInsets = UIEdgeInsetsZero;
    self.scrollEnabled = YES;
    if (self.placeholder_font.ascender <= 0) {
        UILabel *lb = (UILabel *)[self valueForKey:@"_placeholderLabel"];
        lb.font = self.font;
        [lb sizeToFit];
    }
    if (self.minAutoHeight <= 0) {
        self.minAutoHeight = self.frame.size.height;
    }
//    CGRect textFrame = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width-10,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName, nil] context:nil];
    NSInteger height = ceilf([self sizeThatFits:CGSizeMake(self.bounds.size.width, MAXFLOAT)].height);
    
    if (self.frame.size.height > self.minAutoHeight && self.isAutoHeight && height < self.minAutoHeight) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.minAutoHeight);
        return;
    }

    if (height > self.frame.size.height &&  self.maxAutoHeight > height && self.isAutoHeight) {
        //0.1 防止换行 时高度变化导致顶部文字位置移动
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height + 0.1);
        return;
    }

    if (height < self.frame.size.height && self.minAutoHeight < height&& self.isAutoHeight ) {
       self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height + 0.1);
        return;
    }
    
    if (self.maxAutoHeight != 0) {
        return;
    }
    
    if (height > self.frame.size.height && self.isAutoHeight) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height + 0.1);
        return;
    }

}


@end
