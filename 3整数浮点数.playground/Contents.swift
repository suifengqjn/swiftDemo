//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

///整数

///Swift 提供了 8，16，32 和 64 位编码的有符号和无符号整数
let uminValue = UInt8.min;

let umaxValue = UInt8.max;

let minValue = Int8.min;

let maxValue = Int8.max;


///只在的确需要存储一个和当前平台原生字长度相同的无符号整数的时候才使用 UInt 。其他情况下，推荐使用 Int ，即使已经知道存储的值都是非负的。如同类型安全和类型推断中描述的那样，统一使用 Int  会提高代码的兼容性，同时可以避免不同数字类型之间的转换问题，也符合整数的类型推断。



///浮点数

///Double代表 64 位的浮点数。
///Float 代表 32 位的浮点数

///Double 有至少 15 位数字的精度，而 Float 的精度只有 6 位。具体使用哪种浮点类型取决于你代码需要处理的值范围。在两种类型都可以的情况下，推荐使用 Double 类型。
