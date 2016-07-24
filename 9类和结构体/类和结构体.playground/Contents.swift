//: Playground - noun: a place where people can play

import UIKit

///定义语法

//类与结构体有着相似的定义语法，你可以通过使用关键词 class来定义类使用 struct来定义结构体。并在一对大括号内定义它们的具体内容。


struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}


///类与结构体实例

let someResolution = Resolution()
let someVideoMode = VideoMode()

///结构体类型的成员初始化器
let vga = Resolution(width: 33, height:  40)
print(vga)


///结构体和枚举是值类型
//值类型是一种当它被指定到常量或者变量，或者被传递给函数时会被拷贝的类型。



///类是引用类型

//变量或者本身被传递到一个函数的时候它是不会被拷贝的。
//有时候找出两个常量或者变量是否引用自同一个类实例非常有用，
///Swift提供了两个特点运算符
///相同于 ( ===)
///不相同于( !==)



