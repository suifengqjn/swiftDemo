//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


///类型别名可以为已经存在的类型定义了一个新的可选名字。用 "typealias" 关键字定义类型别名。

///typealias <#type name#> = <#type expression#>


typealias SimpleInt = UInt8;

let abc = SimpleInt.min;

print("\(abc)")

