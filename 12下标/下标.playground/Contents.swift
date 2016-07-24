//: Playground - noun: a place where people can play

import UIKit

///下标的语法
subscript(index: Int) -> Int {
    get {
        // return an appropriate subscript value here
    }
    set(newValue) {
        // perform a suitable setting action here
    }
}

newValue 的类型和下标的返回值一样。与计算属性一样，你可以选择不去指定 setter 的( newValue )形式参数。 setter 默认提供形式参数 newValue ，如果你自己没有提供的话。

与只读计算属性一样，你可以给只读下标省略 get 关键字：

subscript(index: Int) -> Int {
    // return an appropriate subscript value here
}

栗子

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")