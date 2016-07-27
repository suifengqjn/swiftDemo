//: Playground - noun: a place where people can play

import UIKit


//你可以使用全局函数 assert(_:_:)  函数来写断言。向 assert(_:_:) 函数传入一个结果为 true 或者 false 的表达式以及一条会在结果为 false 的时候显式的信息：


let age = -3
assert(age >= 0, "A person's age cannot be less than zero")

//在这个栗子当中，代码执行只要在 if age >= 0 评定为 true 时才会继续，就是说，如果 age 的值非负。如果 age 的值是负数，在上文的代码当中， age >= 0 评定为 false ，断言就会被触发，终止应用。
