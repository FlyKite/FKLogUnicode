# FKLogUnicode
能让你的代码在使用NSLog输出字典和数组的时候直接输出中文而不是Unicode编码。  
It will replace unicode to Chinese when you use NSLog(@"%@", dict).

使用指南/Manual
---
只需要将FKLogUnicode.m导入你的项目，不需要再添加任何一行代码即可生效~  
Just import FKLogUnicode.m into your project, then it will effects.  
  
CocoaPods: `pod 'FKLogUnicode'`

效果/Preview
---
代码/Code
```
  NSDictionary *dict = @{
                         @"作者": @"FlyKite",
                         @"作用": @"让NSLog输出字典和数组的时候输出汉字而不是Unicode编码",
                         @"数组": @[@"这是一个字符串", @10086, @{@"emoji": @"支持🤣", @"performance": @"与原生一致的缩进"}]
  };
  NSLog(@"%@", dict);
```
输出/Output
![Preview](https://raw.githubusercontent.com/FlyKite/FKLogUnicode/master/preview.png)
