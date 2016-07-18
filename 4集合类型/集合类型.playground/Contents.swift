//: Playground - noun: a place where people can play

import UIKit

///创建一个空数组
var someInt = [Int]()
someInt.append(3)

//someInt变量的类型通过初始化器的类型推断为 [Int]



///使用默认值创建数组
/// repeating: 默认值
var threeDouble = Array(repeating:2.0, count:3)

///通过连接两个数组来创建数组
var twoDouble = Array(repeating:3.7, count:2)

var newArr = threeDouble + twoDouble //两个数组内元素类型不同不能直接相加


///使用数组字面量创建数组
var shoppingList: [String] = ["Eggs", "Milk"]
var shoppingList2 = ["Eggs", "Milk"]


///访问和修改数组
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

///追加元素
shoppingList.append("meat")
shoppingList += ["Baking Powder"]


var firstItem = shoppingList[0]

//通过下标更改
shoppingList[0] = "err"
print(shoppingList)

shoppingList[2...3] = ["Bananas", "Apples"]
print("==========\(shoppingList)")

shoppingList.insert("bbb", at: 2)


///遍历一个数组
for item in shoppingList {
    print(item)
}

///如果你需要每个元素以及值的整数索引，使用 enumerated()方法来遍历数组
for (index, value) in shoppingList.enumerated() {
    print("Item \(index): \(value)")
}

///-------------------------------------------------------------------
///字典
///创建一个空字典
//创建了类型为 [Int: String]的空字典来储存整数的可读名称。它的键是 Int类型，值是 String类型。
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
print(namesOfIntegers)

var dic:Dictionary = [String: String]()

///用字典字面量创建字典
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//添加新元素
airports["LHR"] = "London"

//updateValue(_:forKey:)方法返回一个字典值类型的可选项值
//这个可选项包含了键的旧值如果更新前存在的话，否则就是 nil
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

///同样可以使用下标脚本语法来从字典的特点键中取回值
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}



///removeValueForKey(_:)来从字典里移除键值对
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

///遍历字典
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}




///-------------------------------------------------------------------
///创建并初始化一个空合集

var letters = Set<Character>()
letters.insert("a")
letters = []

///使用数组字面量创建合集

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
print(favoriteGenres)

let aaa: AnyObject?


///合集类型不能从数组字面量推断出来，所以 Set类型必须被显式地声明
var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]


