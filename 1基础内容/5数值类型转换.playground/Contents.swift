//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/// 如UInt8 UInt16，不同类型的整数不能直接相加
let maxVa = Int.max;

let minVa = Int.min;

let one = 2;
let two = 4.55;
//let three = one + two;  这样会报错

let three = Double(one) + two

///不同的字面量可以直接相加，字面量没有明确的类型，编译器自己推断