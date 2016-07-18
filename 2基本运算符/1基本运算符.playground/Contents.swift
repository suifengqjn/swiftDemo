//: Playground - noun: a place where people can play

import UIKit

///不同于 C ，Swift 允许你对浮点数执行取余操作（ % ）。Swift 还提供了两种 C 中没有的区间运算符（ a..<b  和 a...b ），来让你便捷表达某个范围的值。

///这里只列举与OC不同的地方，或者是swift专有的 


///赋值运算
//如果赋值符号右侧是拥有多个值的元组，它的元素将会一次性地拆分成常量或者变量
let (x, y) = (1, 2)
// x 等于 1, 同时 y 等于 2


///算术运算符
//支持字符串 相加

let astring = "hello" + "world"
print(astring)

///取余
//swift支持对浮点数取余操作

//let yu = 8 % 2.5
//print("\(yu)")


///比较运算符

//Swift 支持所有 C 的标准比较运算符：
//
//相等 ( a == b )
//不相等 ( a != b )
//大于 ( a > b )
//小于 ( a < b )
//大于等于 ( a >= b )
//小于等于 ( a <= b )

var z = 3;
//swift3 取消了++ --操作
z += 1


///字符串可以直接用=做比较
let astr = "name"
let bstr = "name"

if astr == bstr {
    print("a is equal b")
} else {
    
}


///合并空值运算符a ?? b
//如果可选项 a  有值则展开，如果没有值，是 nil  ，则返回默认值 b 。
//表达式 a 必须是一个可选类型。表达式 b  必须与 a  的储存类型相同。

var a: String?
var b: String?

a ?? b

//合并空值运算符是下边代码的缩写：
a != nil ? a! : b

//如果 a  的值是非空的， b  的值将不会被考虑。这就是所谓的 短路计算 。


///区间运算符
///闭区间运算符（ a...b ）定义了从 a  到 b  的一组范围，并且包含 a  和 b  。 a  的值不能大于 b 。
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

print("-------------")
///半开区间运算符
///半开区间运算符（ a..<b ）定义了从 a  到 b  但不包括 b  的区间
for index in 1..<5 {
    print("\(index) times 5 is \(index * 5)")
}