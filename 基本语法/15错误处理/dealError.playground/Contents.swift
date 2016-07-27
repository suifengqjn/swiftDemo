//: Playground - noun: a place where people can play

import UIKit

///使用抛出函数传递错误

func canThrowErrors() throws -> String


func vend(itemNamed name: String) throws {
    guard var item = inventory[name] else {
        throw VendingMachineError.InvalidSelection
    }
    
    guard item.count > 0 else {
        throw VendingMachineError.OutOfStock
    }
    
    guard item.price <= coinsDeposited else {
        throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
    }
    
    coinsDeposited -= item.price
    item.count -= item.count
    inventory[name] = item
    dispenseSnack(name)
}



///使用 Do-Catch 处理错误
//这是 do-catch语句的通常使用姿势：

do {
    try expression
    statements
} catch pattern 1 {
    statements
} catch pattern 2 where condition {
    statements
}


//转换错误为可选项
//如果 someThrowingFunction()抛出一个错误， x和 y的值就是 nil
func someThrowingFunction() throws -> Int {
    // ...
}

let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}


//当你想要在同一句里处理所有错误时，使用 try?能让你的错误处理代码更加简洁。比如，下边的代码使用了一些方法来获取数据，或者在所有方式都失败后返回 nil。
func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() { return data }
    if let data = try? fetchDataFromServer() { return data }
    return nil
}

///取消错误传递
let photo = try! loadImage("./Resources/John Appleseed.jpg")






///指定清理操作
///使用 defer语句来在代码离开当前代码块前执行语句合集
///defer语句延迟执行直到当前范围退出。这个语句由 defer关键字和需要稍后执行的语句组成。被延迟执行的语句可能不会包含任何会切换控制出语句的代码，比如 break或 return语句，或者通过抛出一个错误。延迟的操作与其指定的顺序相反执行——就是说，第一个 defer语句中的代码会在第二个中代码执行完毕后执行，以此类推

///func processFile(filename: String) throws {
if exists(filename) {
    let file = open(filename)
    defer {
        close(file)
    }
    while let line = try file.readline() {
        // Work with the file.
    }
    // close(file) is called here, at the end of the scope.
}
}
