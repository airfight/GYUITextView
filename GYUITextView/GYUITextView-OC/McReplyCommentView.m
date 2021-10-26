//
//  McReplyCommentView.m
//  GYUITextView-OC
//
//  Created by zgy on 2021/10/26.
//  Copyright © 2021 giant. All rights reserved.
//

#import "McReplyCommentView.h"
#import "UITextView+GYCategory.h"
@interface McReplyCommentView()

@property (nonatomic,strong) UITextView *textView;

@end

@implementation McReplyCommentView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    
    _textView = [[UITextView alloc] init];
    _textView.frame = CGRectMake(20, 0, self.frame.size.width - 40, 40);
    _textView.placeholder = @"请输入帅气的名字";
    _textView.placeholder_color = [UIColor purpleColor];
    _textView.isAutoHeight = YES;
    _textView.minAutoHeight = 40.f;
//    textView.placeholder_font = [UIFont systemFontOfSize:20];
    _textView.font = [UIFont systemFontOfSize:20];
    _textView.maxAutoHeight = 160.f;
    _textView.backgroundColor = [UIColor redColor];
    [self addSubview:_textView];

    
}


@end
