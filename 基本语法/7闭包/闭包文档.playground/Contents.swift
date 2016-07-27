//: Playground - noun: a place where people can play

import UIKit


///Sorted 方法

let names = ["Chris","Alex","Ewa","Barry","Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var snNames = names.sorted()
var reversedNames = names.sorted(isOrderedBefore: backward)



///闭包表达式语法

//{ (parameters) -> (return type) in
//    statements
//}



///尾随闭包
func someFunction(closure:() -> Void){
    print("www")
}

someFunction(closure: {
    
})