//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"

var serverResponseCode: Int? = 404
// serverResponseCode 包含一个可选的 Int 值 404
serverResponseCode = nil
// serverResponseCode 现在不包含值


var surveyAnswer: String?
// surveyAnswer is automatically set to nil

///if 语句以及强制解析
//你可以利用 if 语句通过比较 nil 来判断一个可选中是否包含值。利用相等运算符 （ == ）和不等运算符（ != ）。如果一个可选有值，他就“不等于” nil
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}

//当你确定可选类型确实包含值之后，你可以在可选的名字后面加一个感叹号（!）来获取值。这个惊叹号表示“我知道这个可选有值，请使用它。”这被称为可选值的强制解析（forced unwrapping）
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
// 输出 "convertedNumber has an integer value of 123."

///更普遍的写法，optional binding(可选绑定)
if let newcon = convertedNumber {  //convertedNumber 有值才会执行里面的代码
    print(newcon)
}


///你可以在同一个 if 语句中包含多可选项绑定，使用 where 分句来检查布尔量条件：
if let firstNumber = Int("4"), secondNumber = Int("42") where firstNumber < secondNumber {
    print("\(firstNumber) < \(secondNumber)")
}

///隐式展开可选项（适用于初始化有值，并且值一直会存在）
//可选项展开值时
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark

//可选字符串和隐式展开可选字符串
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation mark

//你可以像对待普通可选一样对待隐式展开可选项来检查里边是否包含一个值：
if assumedString != nil {
    print(assumedString)
}

//你也可以使用隐式展开可选项通过可选项绑定在一句话中检查和展开值
if let definiteString = assumedString {
    print(definiteString)
}

//不要在一个变量将来会变为 nil 的情况下使用隐式展开可选项。如果你需要检查一个变量在生存期内是否会变为 nil ，就使用普通的可选项。