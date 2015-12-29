# FKLogUnicode
这些分类能使你的代码在使用NSLog输出字典和数组的时候直接输出中文而不是Unicode编码。  
These categories will replace unicode to Chinese when you use NSLog(@"%@", dict).

使用指南
---
只需要将这几个分类导入你的项目，不需要再添加任何一行代码即可生效~  
Just import these categories into your project, then it will effects.

效果
---
代码/Code
```
  NSDictionary *dict = @{
                        @"作者" : @"FlyKite",
                        @"作用" : @"让NSLog输出字典和数组的时候输出汉字而不是Unicode编码"
                        };
  NSLog(@"%@", dict);
```
输出/Output
```
2015-12-29 14:03:40.930 FKLogUnicodeDemo[1635:771643] {
    "作用" = "让NSLog输出字典和数组的时候输出汉字而不是Unicode编码";
    "作者" = FlyKite;
}
```
