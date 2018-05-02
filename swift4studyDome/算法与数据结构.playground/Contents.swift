//: Playground - noun: a place where people can play

import UIKit

// 1. 计算 1+2+3+...+n
// for 循环
func f1(n: Int) -> Int {
    var sum = 0
    for i in 1...n {
        sum += i
    }
    return sum
}
// 递归(缺点：内存消耗大)
func f2(n: Int) -> Int {
    if (n == 1) {
        return 1
    } else {
        return n + f2(n: n - 1)
    }
}

// 尾递归 ，返回函数本身（防止内存爆炸）
func f3(n: Int, total: Int) -> Int {
    if n == 1 {
        return 1 + total
    } else {
        return (f3(n: n-1, total: total + n))
    }
}

print(f1(n: 5))
print(f2(n: 5))
print(f3(n: 5, total: 0))

// 2. 计算菲波那切数列 1 1 2 3 5 8 13 第n个数是多少
func f4(n: Int) -> Int {
    
    for i in 0..<n {
        print(i)
    }
    
    return 2
    
}

f4(n: 5)


