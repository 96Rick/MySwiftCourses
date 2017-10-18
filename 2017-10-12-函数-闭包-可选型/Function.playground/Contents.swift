//: Playground - noun: a place where people can play

import Cocoa

// MARK: Function

// 函数的必要性和重要性
print("Hello Alex")
print("Hello Allen")
print("Hello Alexander")

switch 89 {
case 0..<60:
    print("not so good")
case 60..<90:
    print("that's just ok")
case 90..<100:
    print("pretty good")
default:
    break
}

func evaluate(score: Int) {
    assert((0...100).contains(score))
    switch score {
    case 0..<60:
        print("not so good")
    case 60..<90:
        print("that's just ok")
    case 90...100:
        print("pretty great")
    default: break
    }
}

evaluate(score: 100)

// 基本定义
//func 函数名(参数列表) -> 返回类型 {
//    
//}

// f(x) = x + 1
// f(2) = 3

// 无参数无返回值
func printGreetings() -> Void {
    print("hello")
    print("hi")
    print("hey")
    print("yoo")
}

// 有返回值
func niceWord() -> String {
    let goodWords = ["hello", "hi", "hey", "yoo"]
    let random = Int(arc4random()) % goodWords.count
    return goodWords[random]
}
let word = niceWord()



// 有参数
func greet(someone: String) {
    print("Hello " + someone + "!")
}

greet(someone: "Allen")

// 外部参数
func sayHi(to someone: String) {
    print("Hi " + someone + "!")
}

sayHi(to: "Halcao")

// 多参数
func say(_ something: String, to someone: String) {
    print("Hey " + someone + ", " + something + "!")
}

say("Ni Hao", to: "Eason")

// 返回元组
func bound(of array: [Int]) -> (min: Int, max: Int) {
    return (min: array.min()!, max: array.max()!)
}

let tuple = bound(of: [2, 3, 4, 1])

// 默认值
func sayHey(to someone: String = "Halcao") {
    print("Hey " + someone + "!")
}

sayHey()
sayHey(to: "Alex")

// 多参数默认值
func tell(_ someone: String = "me", about something: String = "you") {
    print("tell " + someone + " about " + something)
}

tell()
tell("she")
tell("him")
tell(about: "her")
tell("him", about: "her")

// 可变参数
func beat(_ people: String...) {
    for man in people {
        print(man + " is beaten up!")
    }
}

beat("Allen", "RetroX")

// inout 参数

//func swap(a: Int, _ b: Int) {
//    (a, b) = (b, a)
//}

func swap(a: inout Int, b: inout Int) {
    (a, b) = (b, a)
}

var a = 1
var b = 2
swap(a: &a, b: &b)

// 函数作为参数
let function = swap
// (参数表) -> 返回值类型
func foreach(array: [Int], function: (Int)->()) {
    for item in array {
        function(item)
    }
}

func printInt(value: Int) {
    print(value)
}
foreach(array: [1, 2, 3, 4], function: printInt)

// 函数作为返回值
func sayFine() {
    print("fine")
}

func sayFuck() {
    print("F word")
}

func areYouOK(ok: Bool) -> () -> () {
    return ok ? sayFine : sayFuck
}

let saySomething = areYouOK(ok: true)
saySomething()


