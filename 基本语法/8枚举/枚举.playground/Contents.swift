//: Playground - noun: a place where people can play

import UIKit

///eg;
//不像 C 和 Objective-C 那样，Swift 的枚举成员在被创建时不会分配一个默认的整数值。
//也可给每种类型赋任意值
enum CompassPoint {
    case North
    case South
    case East
    case West
}

CompassPoint.North


///关联值
//以创建条形码为例
enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}


var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
var productBarcode2 = Barcode.QRCode("ABCDEFGHIJKLMNOP")


///原始值

enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}


///隐式指定的原始值

enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
//在上面的例子中， Planet.Mercury有一个明确的原始值 1 ， Planet.Venus的隐式原始值是 2，以此类推。





///递归枚举

//递归枚举是拥有另一个枚举作为枚举成员关联值的枚举。当编译器操作递归枚举时必须插入间接寻址层。你可以在声明枚举成员之前使用 indirect关键字来明确它是递归的。


enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}





