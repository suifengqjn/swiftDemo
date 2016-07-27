//: Playground - noun: a place where people can play

import UIKit

//当一个函数遇到错误情况，他会抛出一个错误，这个函数的访问者会捕捉到这个错误，并作出合适的反应。

func canThrowAnError() throws {
    // this function may or may not throw an error
}

//通过在函数声明过程当中加入 throws 关键字来表明这个函数会抛出一个错误。当你调用了一个可以抛出错误的函数时，需要在表达式前预置 try 关键字。
//Swift 会自动将错误传递到它们的生效范围之外，直到它们被 catch 分句处理。

do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}

///do 语句创建了一个新的容器范围，可以让错误被传递到到不止一个的 catch 分句里。

//下面的栗子演示了如何利用错误处理机制处理不同的错误情况：

func makeASandwich() throws {
    // ...
}

do {
    try makeASandwich()
    eatASandwich()
} catch Error.OutOfCleanDishes {
    washDishes()
} catch Error.MissingIngredients(let ingredients) {
    buyGroceries(ingredients)
}