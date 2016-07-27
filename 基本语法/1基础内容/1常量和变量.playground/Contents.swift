//: Playground - noun: a place where people can play

import UIKit

///  1. 声明常量和变量
let number = 10;
var str = "Hello, playground";

///可以在一行中声明多个变量或常量，用逗号分隔：
let a = 1, b = 1.2, c = 33.9
var x = 0.6, y = "dds", z = 0.0




/// 2. 类型标注
var message: String     //指明这个变量的类型是String
message = "dsdsdsd"

var me1, me2, me3: String

///实际上，你并不需要经常使用类型标注。如果你在定义一个常量或者变量的时候就给他设定一个初始值，那么 Swift 就像类型安全和类型推断中描述的那样，几乎都可以推断出这个常量或变量的类型。



/// 3. 命名常量和变量
//常量和变量的名字几乎可以使用任何字符，甚至包括 Unicode 字符：


let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
///如果你需要使用 Swift 保留的关键字来给常量或变量命名，可以使用反引号（ ` ）包围它来作为名称。总之，除非别无选择，避免使用关键字作为名字除非你确实别无选择
var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"

///print(_:separator:terminator:) 是一个用来把一个或者多个值用合适的方式输出的全局函数。
///通过\()来转译输出
print("The current value of friendlyWelcome is \(friendlyWelcome)")
print("\(🐶🐮)")

