//: Playground - noun: a place where people can play

import UIKit

///下面的栗子定义了一个名为 Fahrenheit 结构体以储存华氏度表示的温度。
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}


///通过提供 temperature 属性的默认值，你可以把上面的 Fahrenheit 结构体写的更简单：
struct Fahrenheit2 {
    var temperature = 32.0
}



///初始化形式参数
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

///形式参数名和实际参数标签
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}

///可选属性类型

class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

///在初始化中分配常量属性
class SurveyQuestion2 {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}



///默认初始化器

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()



///指定初始化器和便捷初始化器语法
//用与值类型的简单初始化器相同的方式来写类的指定初始化器：

init( parameters) {
    statements
}
//便捷初始化器有着相同的书写方式，但是要用 convenience 修饰符放到 init 关键字前，用空格隔开：

convenience init(parameters) {
    statements
}




///初始化器的继承和重写
///当重写父类指定初始化器时，你必须写 override 修饰符，就算你子类初始化器的实现是一个便捷初始化器。



