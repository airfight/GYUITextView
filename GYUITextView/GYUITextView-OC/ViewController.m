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
#import <objc/runtime.h>
#import <objc/message.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 通过运行时，发现UITextView有一个叫做“_placeHolderLabel”的私有变量
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([UITextView class], &count);
    
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *objcName = [NSString stringWithUTF8String:name];
        NSLog(@"%d : %@",i,objcName);
    }

    UITextView *textView = [[UITextView alloc] init];
    textView.frame = CGRectMake(20, 40, 300, 80);
    textView.placeholder = @"请输入姓名鬼纸质大哇";
    textView.placeholder_color = [UIColor purpleColor];
    textView.isAutoHeight = YES;

//    textView.placeholder_font = [UIFont systemFontOfSize:20];
    textView.font = [UIFont systemFontOfSize:20];
    textView.maxAutoHeight = 400.f;
    textView.backgroundColor = [UIColor redColor];
    [self.view addSubview:textView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
