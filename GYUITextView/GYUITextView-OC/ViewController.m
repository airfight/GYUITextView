//
//  ViewController.m
//  GYUITextView-OC
//
//  Created by giant on 16/12/3.
//  Copyright © 2016年 giant. All rights reserved.
//

#import "ViewController.h"
#import "GYUITextView.h"
#import "UITextView+GYCategory.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;

    UITextView *textView = [[UITextView alloc] init];
    textView.frame = CGRectMake(20, 40, 50, 50);
    textView.placeholder = @"请输入姓名鬼纸质大哇哦1大";
    textView.placeholder_color = [UIColor redColor];
    textView.placeholder_font = [UIFont systemFontOfSize:20.f];
    textView.font = [UIFont systemFontOfSize:15.0f];
    textView.isAutoHeight = YES;

    [textView setMaxAutoHeight:200];
    textView.alwaysBounceVertical = YES;
    textView.backgroundColor = [UIColor redColor];
    [self.view addSubview:textView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
