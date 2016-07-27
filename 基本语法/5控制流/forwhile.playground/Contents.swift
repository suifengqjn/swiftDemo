//: Playground - noun: a place where people can play

import UIKit

///for-in循环，用来更简单地遍历数组（array），字典（dictionary），区间（range），字符串（string）和其他序列类型。

for index in 1...5 {
    print(index)
}

///如果不需要知道区间序列内每一项的值，你可以使用下划线（_）替代变量名来忽略对值的访问：

for _ in 1..<5 {
    print("------")
}

//遍历数组
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

//遍历字典
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}



///while 循环
///两种while循环形式：
/// while循环，每次在循环开始时计算条件是否符合；
/// repeat-while循环，每次在循环结束时计算条件是否符合。

var a = 3
var b = 6
while a < b {
    a += 1
    print(a)
}

print("=============")

var c = 3
var d = 6
repeat {
    c += 1
    print(c)
} while c < d



///switch
///switch语句会尝试把某个值与若干个模式（pattern）进行匹配。根据第一个匹配成功的模式，switch语句会执行对应的代码。

///case后面可以匹配多种情况，不需要break，不会贯穿
///每一个 case 分支都必须包含至少一条语句

let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}
// 输出 "e is a vowel"

///区间匹配
///case 分支的模式也可以是一个值的区间
let index = 10;
var strCount = ""
switch index {
case 0:
    strCount = "no"
case 1..<5:
    strCount = "a few"
case 5...10:
    strCount = "a lot"
default:
     strCount = "many"
}



///元祖
///我们可以使用元组在同一个switch语句中测试多个值。元组中的元素可以是值，也可以是区间。另外，使用下划线（_）来匹配所有可能的值。
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}

//Swift 允许多个 case 匹配同一个值。实际上，在这个例子中，点(0, 0)可以匹配所有四个 case。但是，如果存在多个匹配，那么只会执行第一个被匹配到的 case 分支。考虑点(0, 0)会首先匹配case (0, 0)，因此剩下的能够匹配(0, 0)的 case 分支都会被忽视掉。


///值绑定（Value Bindings）
//case 分支的模式允许将匹配的值绑定到一个临时的常量或变量
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

/////where
///case 分支的模式可以使用where语句来判断额外的条件。
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}



///控制转移语句（Control Transfer Statements）

//continue
//break
//fallthrough
//return
//throw


///continue break 语义不变


///贯穿（Fallthrough）
///swift 默认是不贯穿，如果需要贯穿，在case后面加上 fallthrough
let numbera = 5
switch numbera {
case 3...5:
    print("第一次")
    fallthrough
case 4...5:
    print("第二次")
    fallthrough
default:
    print("第三次")
}



///带标签的语句
没看懂这块，以后再说



///检测 API 可用性
if #available(iOS 9, OSX 10.10, *) {
    // 在 iOS 使用 iOS 9 的 API, 在 OS X 使用 OS X v10.10 的 API
} else {
    // 使用先前版本的 iOS 和 OS X 的 API
}

















