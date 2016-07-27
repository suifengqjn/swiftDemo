//: Playground - noun: a place where people can play

import UIKit

///扩展的语法
//使用 extension 关键字来声明扩展：


extension SomeType {
    // new functionality to add to SomeType goes here
}

//扩展可以使已有的类型遵循一个或多个协议。在这种情况下，协议名的书写方式与类或结构体完全一样：


extension SomeType2: SomeProtocol, AnotherProtocol {
    // implementation of protocol requirements goes here
}


///方法
//扩展可以为已有的类型添加新的实例方法和类型方法。下面的例子为 Int 类型添加了一个名为 repetitions 的新实例方法：
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}


///异变实例方法
extension Int {
    mutating func square() {
        self = self * self
    }
}

public：可以访问同一模块源文件中的任何实体，在模块外也可以通过导入该模块来访问源文件里的所有实体。通常情况下，框架中的某个接口可以被任何人使用时，你可以将其设置为 public 级别。
internal：可以访问同一模块源文件中的任何实体，但是不能从模块外访问该模块源文件中的实体。通常情况下，某个接口只在应用程序或框架内部使用时，你可以将其设置为 internal 级别。
private：限制实体只能在所在的源文件内部使用。使用 private 级别可以隐藏某些功能的实现细节。


