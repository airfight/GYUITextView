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
@dynamic placeholder_font;
@dynamic isAutoHeight;

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



- (void)setMaxAutoHeight:(CGFloat)maxAutoHeight
{

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.scrollIndicatorInsets = UIEdgeInsetsZero;
    CGRect textFrame = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width-10,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName, nil] context:nil];
    
    if (textFrame.size.height > self.frame.size.height &&  200 > textFrame.size.height) {
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, textFrame.size.height);
        return;
    }
    
    
    if (textFrame.size.height < self.frame.size.height && 30 < textFrame.size.height) {
       self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, textFrame.size.height + 10);
    }

}


@end
