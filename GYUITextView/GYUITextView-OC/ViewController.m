//
//  ViewController.m
//  GYUITextView-OC
//
//  Created by giant on 16/12/3.
//  Copyright © 2016年 giant. All rights reserved.
//

#import "ViewController.h"
#import "UITextView+GYCategory.h"
#import <objc/runtime.h>
#import <objc/message.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *gy_textView;

@end

@implementation ViewController
{
    UITextView *textView;
    UIView *SubmitView;

}

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

    //导航栏导致占位符问题
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(action:) name:UITextViewTextDidChangeNotification object:nil];

    textView = [[UITextView alloc] init];
    textView.frame = CGRectMake(20, 80, self.view.frame.size.width - 40, 80);
    textView.placeholder = @"请输入帅气的名字";
    textView.placeholder_color = [UIColor purpleColor];
    textView.isAutoHeight = YES;

//    textView.placeholder_font = [UIFont systemFontOfSize:20];
    textView.font = [UIFont systemFontOfSize:20];
    textView.maxAutoHeight = 200.f;
    textView.backgroundColor = [UIColor redColor];
    [self.view addSubview:textView];

    SubmitView = [[UIView alloc] init];
    SubmitView.frame = CGRectMake(40, textView.frame.size.height + textView.frame.origin.y + 5, self.view.frame.size.width - 80, 40);
    SubmitView.backgroundColor = [UIColor blueColor];
    SubmitView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:SubmitView];

    /*
    textView.translatesAutoresizingMaskIntoConstraints = NO;
    SubmitView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [textView addConstraint:[NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:200]];
    [textView addConstraint:[NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:SubmitView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:textView attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:SubmitView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:textView attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0]];
      [self.view addConstraint:[NSLayoutConstraint constraintWithItem:SubmitView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:textView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:SubmitView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:textView attribute:NSLayoutAttributeBottom multiplier:1 constant:10]];
     [self.view addConstraint:[NSLayoutConstraint constraintWithItem:textView attribute:NSLayoutAttributeTop | NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop | NSLayoutAttributeLeft multiplier:1 constant:100]];
       [self.view addConstraint:[NSLayoutConstraint constraintWithItem:textView attribute:  NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:100]];
     */

}

- (void)action:(NSNotification *)info
{
    SubmitView.frame = CGRectMake(40, textView.frame.size.height + textView.frame.origin.y + 5, self.view.frame.size.width - 80, 40);
    
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)updateViewConstraints
{
    [super updateViewConstraints];
    NSLog(@"updateViewConstraints");
}

- (void)updateFocusIfNeeded
{
    [super updateFocusIfNeeded];
    NSLog(@"updateFocusIfNeeded");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
