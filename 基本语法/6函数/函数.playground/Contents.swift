//: Playground - noun: a place where people can play

import UIKit

///以 func 作为前缀。指定函数返回类型时，用返回箭头 ->（一个连字符后跟一个右尖括号）后跟返回类型的名称的方式来表示。


func sayHello() -> Void {
    print("hello")
}

sayHello()

///参数：string 返回值：string
func sayhello(personName: String) -> String {
    
    return "hello" + personName + "!"
}


var str = sayhello(personName: "Tom")



///无参函数
func sayHi() -> String {
    return "hello , world!"
}


///多参数函数
func sayHell(personName:String, isalreadyGreet:Bool) -> String {
    if isalreadyGreet {
        return "a"
    } else {
        return "b"
    }
}

print(sayHell(personName: "bbb", isalreadyGreet: true))


///无返回值函数
func sayGoodBye(personName: String) {
    print("goodBye,\(personName)")
}


///多重返回值函数
//你可以用元组（tuple）类型让多个值作为一个复合值从函数中返回

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}


///可选元祖返回类型
func minMaxArr(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

//用可选绑定来检查是否有返回值
if let bounds = minMaxArr(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}



///函数实际参数标签和形式参数名
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(firstParameterName: 1, secondParameterName: 2)



///指定实际参数标签

func someFunction(argumentLabel parameterName: Int) {
    // In the function body, parameterName refers to the argument value
    // for that parameter.
}
//如果你为一个形式参数提供了实际参数标签，那么这个实际参数就必须在调用函数的时候使用标签。

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))



///指定外部参数名
//你可以在局部参数名前指定外部参数名，中间以空格分隔：
func someFunction2(externalParameterName localParameterName: Int) {
    // function body goes here, and can use localParameterName
    // to refer to the argument value for that parameter
}
//如果你提供了外部参数名，那么函数在被调用时，必须使用外部参数名。
someFunction2(externalParameterName: 3)




///忽略外部参数名(一般很少会这么用吧)
//如果你不想为参数设置外部参数名，用一个下划线（_）代替一个明确的参数名。
func someFunction3(_ firstParameterName: Int, _ secondParameterName: Int) {
    print(firstParameterName + secondParameterName)
    // function body goes here
    // firstParameterName and secondParameterName refer to
    // the argument values for the first and second parameters
}

someFunction3(1, 2)

func someFunction4(_ firstParameterName: Int,  secondParameterName: Int) {
    print(firstParameterName + secondParameterName)
    // function body goes here
    // firstParameterName and secondParameterName refer to
    // the argument values for the first and second parameters
}

someFunction4(1, secondParameterName:2)



///可变参数
///一个可变参数（variadic parameter）可以接受零个或多个值
///通过在变量类型名后面加入（...）的方式来定义可变参数
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}


arithmeticMean(numbers: 1, 2, 3, 4, 5)
arithmeticMean(numbers: 1, 2.6, 3)


///输入输出形式参数
//这里有一个 swapTwoInts(_:_:)函数，它有两个输入输出整数形式参数 a和 b：
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


///函数类型
//每一个函数都有一个特定的函数类型，它由形式参数类型，返回类型组成。

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func printHelloWorld() {
    print("hello, world")
}

/////使用函数类型
//你可以像使用 Swift 中的其他类型一样使用函数类型。例如，你可以给一个常量或变量定义一个函数类型，并且为变量指定一个相应的函数。
/// 简而言之，就是把一个函数用一个变量来代替，便于使用
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")



///函数类型作为形式参数类型

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)



///函数类型作为返回类型
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}


func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backwards: currentValue > 0)


////内嵌函数
func chooseStepFunction2(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}
var currentValue2 = -4
let moveNearerToZero2 = chooseStepFunction(backwards: currentValue2 > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue2 != 0 {
    print("\(currentValue2)... ")
    currentValue2 = moveNearerToZero2(currentValue2)
}
