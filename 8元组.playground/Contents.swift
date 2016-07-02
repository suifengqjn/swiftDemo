//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


///元组把多个值合并成单一的复合型的值。元组内的值可以是任何类型，而且可以不必是同一类型。
///

let httpError = (404, "Not Found");



///将一个元组的内容分解成单独的常量或变量，
let (statusCode, statusMessage) = httpError;

print("The status code is \(statusCode)")

print("The status message is \(statusMessage)")

///当你分解元组的时候，如果只需要使用其中的一部分数据，不需要的数据可以用下滑线（ _ ）代替：

let (justTheStatusCode, _) = httpError
print("The status code is \(justTheStatusCode)")
// prints "The status code is 404"



///另外一种方法就是利用从零开始的索引数字访问元组中的单独元素：

print("The status code is \(httpError.0)")
// prints "The status code is 404"
print("The status message is \(httpError.1)")
// prints "The status message is Not Found"


///你可以在定义元组的时候给其中的单个元素命名：

let http200Status = (statusCode: 200, description: "OK")

///在命名之后，你就可以通过访问名字来获取元素的值了：
print("The status code is \(http200Status.statusCode)")
// prints "The status code is 200"
print("The status message is \(http200Status.description)")
// prints "The status message is OK"

