//: Playground - noun: a place where people can play

import UIKit

///空字符串的初始化

let emptyStr = ""
let emptyStr2 = String()

///通过检查布尔量 isEmpty属性来确认一个 String值是否为空：

if emptyStr.isEmpty {
    print("emptyStr is nil")
}

///遍历字符

let stringvalue1 = "afhfha!@#我是一个、"
for character in stringvalue1.characters {
    print(character)
}

///连接字符串和字符
//用 + 号连接2个字符串
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

// += 实现字符串追加
welcome += "123"

// appending()实现字符串追加
welcome = welcome.appending("iamkkkk")


///字符串插值

//每一个你插入到字符串字面量的元素都要被一对圆括号包裹，然后使用反斜杠前缀 \()
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
print(message)


///字符统计 (.characters.count)

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")


///字符串索引
//String.Index，它相当于每个 Character在字符串中的位置
let greeting = "Guten Tag! hello"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)

greeting[index]
// a

//尝试访问的 Character如果索引位置在字符串范围之外，就会触发运行时错误
//greeting[greeting.endIndex] // error

///使用 characters属性的 indices属性来创建所有能够用来访问字符串中独立字符的索引范围 Range。
for index2 in greeting.characters.indices {
    print("\(greeting[index2]) ", terminator: "")
}




///插入和删除
///使用 insert(_:at:)方法，另外要冲入另一个字符串的内容到特定的索引，使用 insert(contentsOf:at:) 方法。

var weclome2 = "welcome"
weclome2.insert("!",at: weclome2.endIndex)
print(weclome2)

weclome2.insert(contentsOf:" there".characters, at: weclome2.index(before: weclome2.endIndex))
print(weclome2)


///要从字符串的特定索引位置移除字符，使用 remove(at:)方法，另外要移除一小段特定范围的字符串，使用 removeSubrange(_:) 方法：
weclome2.remove(at: weclome2.index(before: weclome2.endIndex))
print(weclome2)

let range = weclome2.index(weclome2.endIndex, offsetBy: -6)..<weclome2.endIndex
weclome2.removeSubrange(range)
print(weclome2)



///字符串和字符相等性
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}



///前缀和后缀
let ispewquo = quotation.hasPrefix("We")
let ishewquo = quotation.hasSuffix("We")






///字符串字面量中的特殊字符
//转义特殊字符 \0 (空字符)， \\ (反斜杠)， \t (水平制表符)， \n (换行符)， \r(回车符)， \" (双引号) 以及 \' (单引号)；
//任意的 Unicode 标量，写作 \u{n}，里边的 n是一个 1-8 个与合法 Unicode 码位相等的16进制数字。
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}" // $, Unicode scalar U+0024
let blackHeart = "\u{2665}" // ♥, Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496




