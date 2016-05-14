//: Playground - noun: a place where people can play

import UIKit

//格式
/*
func 函数名称(参数列表)-> 返回值
{
    执行代码
}
*/

// 1.()代替void
// 2.没有 返回值可以省略 ->()

// 1.无返回值无参数
//函数定义
func say1() -> Void
{
    print("asd")
}

say1() //函数调用


func say2() -> Void
{
    print("asdss")
}

say2()


// 2.有返回值无参数

func say3() -> Int
{
    return 12
}

var a = say3()

print(a)



//有参数有返回值
func say4(a:Int, b:Float) -> Int
{
    return (a + Int(b)) //不同类型相加需要强制转换
}


var b:Int = say4(4, b: 5.5) //第二个参数会作为标签，提高阅读性

//手动添加标签,x,y作为标签供外部使用
func say5(x a:Int, y b:Int) -> Int
{
    return a + b
}

say5(x: 4, y: 1)
