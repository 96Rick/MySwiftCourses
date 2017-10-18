//: Playground - noun: a place where people can play

import Cocoa

//var str = "Hello, playground"


switch 89 {
case 0..<60:
    print("not so good")
case 60...100:
    print("just ok")
default:
    break
}

// f(x, y) = x + y + 1
// f(1) = 2

// evaluate(score: 80)


func evaluate(score: Int) -> String {
    guard (0...100).contains(score) else {
        fatalError("你写错了！")
    }
    switch score {
    case 0..<60:
        return "not so good"
    case 60...100:
        return "just ok"
    default:
        return "wrong score"
    }
}

func greet() {
    print("Hello")
}

// int func(int a, int b);
// func(1, 2);

let grade = evaluate(score: 80)

//func say(something: String, someone: String) {
//    print(something + ", " + someone)
//}

// 外部参数名
//say(something: "Hi", someone: "Alex")

//func say(_ something: String, to someone: String) {
//    print(something + ", " + someone)
//}
// say(something: "Hi", someone: "Alex")
//say("Hi", to: "Alex")

func say(_ something: String = "Hi", to someone: String = "Allen") {
    print(something + ", " + someone)
}

say(to: "Allen")
say("Hello", to: "Allen")

say()

func bound(of array: [Int]) -> (min: Int, max: Int) {
    return (array.min()!, array.max()!)
}

let minMax = bound(of: [1, 2, 3, 4, 5])

minMax

// printf("%d, %d", a, b);

func beat(people: String...) {
    for man in people {
        print(man + " is beaten up!")
    }
}

beat(people: "Allen", "Retro", "Someone")

func swap(a: inout Int, b: inout Int) {
    (a, b) = (b, a)
}
var a = 1
var b = 2
swap(a: &a, b: &b)

a
b
//(Int, Int) -> ()
//(Int, Int) -> Void
//Void -> Void
//Void -> (String)
//Void -> String

func foreach(array: [Int], function: (Int)->()) {
    for item in array {
        function(item)
    }
}

func once(item: Int) {
    print(item*item)
}

//foreach(array: [10, 20, 30, 40], function: once)

//foreach(array: [1, 2, 3, 4], function: { item in
//    print(item*item)
//})

//foreach(array: <#T##[Int]#>, function: <#T##(Int) -> ()#>)
//(Int)->()

//let closure = { (a: Int, b: Int) -> Bool in
//    return a > b
//}
//
//closure(1, 2)

let array = [2, 4, 1, 8, 3]
let newArray = array.sorted()

array.sorted(by: { (a, b) -> Bool in
    return a > b
})

func sort(array: inout [Int], by method: (Int, Int)->(Bool)) {
    for i in 0..<array.count {
        for j in 0..<array.count-1-i {
            if method(array[j], array[j+1]) {
                swap(&array[j], &array[j+1])
            }
        }
    }
}

var arr = [2, 3, 8, 1, 0]
sort(array: &arr, by: { a, b in
    return a < b
})

sort(array: &arr, by: { $0 < $1 })

arr

sort(array: &arr) { $0 < $1 }



var favoriteNumber = 0
/// NULL === 0
// 可选型 nil != 0
//favoriteNumber = nil

var number: Int? = 0
number = nil
number = 1
number = 2

//number + 1
// Unwrap 解包
// 1.强制解包

let num = number

// 2.
if number != nil {
    print(number!)
}

// 3. if let 

if number != nil {
    let newNumber = number!
    print(newNumber)
}
if let newNumber = number {
    print(newNumber)
}
if let number = number {
    print(number)
}

let aNumber: Int? = nil
if var aNumber = aNumber,
    let number = number {
    print(aNumber)
} else {
    print("number is nil")
}

// 4. guard let

func notNil(string: String?) {
    guard let string = string else {
        return
    }

    print("Not nil")
}

notNil(string: nil)

// Optional Chaining
let aString: String? = "sdsd"
"nil".hash
let uppercased = aString?.uppercased().lowercased()
// 
var aStr = ""
if aString == nil {
    aStr = "nil"
} else {
    aStr = aString!
}

aStr = aString == nil ? "nil" : aString!

aStr = nil ?? "nil"

let range = "Hello".range(of: "oo")

var numStr = "123o"
let intValue = Int(numStr)

var anyArray: [Any] = ["123", 123]

let first = anyArray[0]

//if first is String {
//    String(first)
//}

let string = "123"

// var sss: String!
// print(sss)
// sss = "asdjkas"
