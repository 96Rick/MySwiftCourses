//: Playground - noun: a place where people can play

import UIKit

// 函数与闭包


//print("Hello Rick")
//print("Hello World")


//
//switch 89 {
//case 0..<60:
//    print("Not Good")
//case 60..<100:
//    print("Just OK")
//default :
//    break
//
//}

func evaluate(score: Int) -> String {
    switch score {
    case 0..<60:
        return "Not Good"
    case 60..<100:
        return "Just OK"
    default :
        return "worng score"
    }
}

print(evaluate(score: 99))

let grade = evaluate(score: 70)

func greet() {
    print("Hello")
}

// 外部参数 ：内部参数前加一个外部参数名，使用空格分割内参外参

func say(_ something: String,to someone: String) {
    print(something + "," + someone)
}

//say(something: "Hi", someone: "Alex")
say("Hi", to: "Alex")

// 函数默认值 ：


func sayHi(_ something: String = "Hi",to someone: String = "Rick") {
    print(something + "," + someone)
}
sayHi(to: "Rick")
sayHi("Hello", to: "Rick")
sayHi()

func bound(of array: [Int]) -> (min: Int, max: Int) {
    return (array.min()!, array.max()!)
}

let minmax = bound(of: [1, 2, 3, 4, 5])

func beat(people: String...) {
    for man in people {
        print(man + "is beaten up!")
    }
}

beat(people: "allen", "rick", "sam")

// inout 在函数内会被改变

func swap(a: inout Int, b: inout Int) {
    (a, b) = (b, a)
}
var a = 1
var b = 2


swap(&a, &b)
a
b

// 函数嵌套

func foreach(array: [Int], function: (Int) -> Void ) /*-> Void*/ {
    for item in array {
        function(item)
    }
}

func once(item: Int) {
    print(item * item)
}
foreach(array: [10, 20, 30], function: once)

//(Int, Int) -> ()
//(Int, Int) -> Void
//Void -> Void
//Void -> (String)
//Void -> String

// 闭包：

let closure = { (a: Int, b: Int) -> Bool in
    return a > b
}
closure(1, 2)

let array = [2, 4, 9, 5, 6, 7].sorted()
array.sorted (by: { (a, b) -> Bool in
    return a > b
})

func sort(array: inout [Int], by method: (Int, Int) -> (Bool)) {
    for i in 0..<array.count {
        for j in 0..<array.count-1-i {
            if method(array[j],array[j+1]) {
                array.swapAt(j, j+1)
            }
        }
    }
}
var arr = [2, 3, 5, 1, 6]
sort(array: &arr) { (a, b) -> (Bool) in
    return a < b
}
arr

sort(array: &arr) { $0 < $1 }

// 闭包回调

// operation nil(空)
var favoriteNum = 1
//favoriteNum = nil

var number: Int?
number = nil
number = 1

let num = number
// unwrapped 解包
//  1.强制解包   number！(不安全)
//  2.判断
if number != nil {
    print(number!)
}
//  3.if let
if number != nil {
    let newNumber = number!
    print(newNumber)
}
let aNum: Int? = nil
if let newNumber = number {
    print(newNumber)
} else {
    print("number is nil")
}
//  4.guard let

//func evaluate1(score: Int) -> String {
//    guard (0...100).contains(score) else {
//        print("worng")
//    }
//    switch score {
//    case 0..<60:
//        return "Not Good"
//    case 60..<100:
//        return "Just OK"
//    default :
//        return "worng score"
//    }
//}


func notNil(string: String?) {
    guard let string = string else {
        return
    }
}
"nil".hash
let aString: String? = "23"
let uppercased = aString?.uppercased().lowercased().hash

//if

var aStr = aString == nil ? "nil" : aString!
aStr = nil ?? "nil"

let range = "Hello".range(of: "oo")
range
var n1um = "123"
var intNum = Int(n1um)

var anyArr: [Any] = ["123", 123]

let first = anyArr[0]

if let firstString = first as? String {
    firstString
}


// 隐式可选型
var sss: String!
print(sss)











