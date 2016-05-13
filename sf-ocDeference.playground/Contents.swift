//: Playground - noun: a place where people can play

import UIKit


/*
 创建对象
 OC:     alloc initWithXXX 方法
 Swift:  (xxx:)
 
 调用方法
 OC:     [UIColor redColor];
 Swift   UIColor.redColor()
 
 枚举
 OC:      UIButtonTypeContactAdd
 Swift:   UIButtonType.ContactAdd
 */


let view = UIView(frame: CGRectMake(100,100,100,100))
view.backgroundColor = UIColor.greenColor()

let btn = UIButton(type: UIButtonType.ContactAdd)
btn.center = CGPointMake(50, 50)
view.addSubview(btn)



//if

var score = 9.9

if score > 0{

print(score)
    
}



//1.Swift是用双引号
//Swift中的字符串是一个结构体
var str: String = "xaoming"

// 拼接
var str1 = "aaa"

var str2 = "bbb"

str1 += str2

//格式化
let num = 30

let name = "xiaoming"

var str3 = "name = \(name), age = \(num)"

//类似OC的StringWithFormate

//09:08:23
var str4 = String(format: "%02d :%02d :%02d", argumnets: [9,8,23])

//截取
//把swift字符串转换为OC字符串2种方式

var str5:NSString = "xiaoming"

var str6 = "zhangsan" as NSString

var str7 = str6.substringToIndex(2)
var str8 = str6.substringWithRange(NSMakeRange(0, 5))

//swift字符产支持直接遍历

var str9 = "gcblog.github.com"
for c in str9.characters
{
    print(c)
}
