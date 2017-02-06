# GYUITextView
带有placeHolder,高度且可变化可设置高度增加上限的UITextView

****
## 效果图
![textgy.gif](https://cl.ly/3y120W3Y241U)
## 使用方法
* 导入头文件#import "UITextView+GYCategory.h"文件
* 设置相关属性


```
  textView.placeholder = @"请输入帅气的名字";
  textView.placeholder_color = [UIColor purpleColor];
  textView.isAutoHeight = YES;//设置高度变化
  textView.minAutoHeight = 150;//此变量鸡肋，无需设置,或设置它大于textView首次初始化大小
  // textView.placeholder_font = [UIFont systemFontOfSize:20];
  textView.font = [UIFont systemFontOfSize:20];//占位符大小默认与此相同
  textView.maxAutoHeight = 200.f;
  
```

### 小农丶
