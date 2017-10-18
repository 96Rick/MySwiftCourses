//: Playground - noun: a place where people can play

import UIKit
import Foundation

//    一. 函数
// 1. 根据函数调用写出函数声明。
//  add("1", and: "2")
func add( _ str: String, and anotherStr: String) {
    print(Int(str + anotherStr) ?? "请输入两个只含有数字的字符串")
}
add("1", and: "2")

//  let string = talk(to: "Halcao", about: "Swift")
func talk(to someone: String, about something: String) -> String {
    return "Talk \(someone) about \(something)"
}

//  see(someone: "Allen")
func see(someone: String...) {
    for someone in someone {
        print("Hi,\(someone)")
    }
}
see(someone: "rick", "allen", "alex")

//  let newArray: [Int] = array.sorted(by: >)
let array = [1, 2, 3, 4]
let newArray: [Int] = array.sorted(by: > )

//  swap(&a, &b)
func swap(_ a: inout Int, _ b: inout Int) {
    (a, b) = (b, a)
}
var a = 1
var b = 2
swap(&a, &b)
a
b

//  2.根据描述完成下列函数
//      (1)编写一个接受两个参数的函数:Double 型数组、Bool 型是否升序排列，返回一个排好序的数组
func sort(array: [Double], isAcsendingOrder bool: Bool) -> [Double] {
    var resultArray: [Double]
    switch bool {
    case true:
        resultArray = array.sorted(by: <)
    case false:
        resultArray = array.sorted(by: >)
    }
    return resultArray
}
sort(array: [1.2, 3.4, 4.5, 5.1, 1], isAcsendingOrder: true)

//      (2)编写一个替换字符串中子字符串的函数，函数接受三个参数:原始字符串、被替换字符串、替换字符串，函数返 回替换好的字符串
extension String {
    func has(v:String)->Bool {
        return self.components(separatedBy: v).count > 1
    }
}
func kStringByReplaceString(string: String, wannaReplaceStr: String, replaceStr: String) -> String {
    var resultStr = ""
    if string.has(v: wannaReplaceStr) {
        print("yes")
        resultStr = string.replacingOccurrences(of: wannaReplaceStr, with: replaceStr)
    }
    return resultStr
//    var resultArray = [Character]()
//
//    if string.has(v: wannaReplaceStr) {
//
//        for item in string {
//            resultArray.append(item)
//        }
//
//        for item in resultArray {
//            if wannaReplaceStr.first == item {
//
//            }
//        }
//
//    }
//    print(resultArray)
//    return string
}
print(kStringByReplaceString(string: "Hello,Rick", wannaReplaceStr: "Rick", replaceStr: "CDC"))

//      (3)编写一个函数求一组数的平均值，函数接受变长参数，函数返回平均值 (Int、Double、Float 均可)。
func getAverage(of numbers: Double...) -> Double {
    var sumNumber = 0.0
    var numCount = 0
    for num in numbers {
        sumNumber += num
        numCount += 1
    }
    return sumNumber / Double(numCount)
}

print(getAverage(of: 3.5, 3))

//      (4)编写一个带有默认参数值的函数。
func say(_ hi: String = "Hi", to somebody: String = "Rick") {
    print("\(hi),\(somebody)")
}
say()

//                       —————————————— 我是分割线 ————————————————
//      二、闭包
//  1. 自己试着使用数组的 sort(by:) 方法，并提交一版实现，并根据随机数判断两个元素是否需要交换位置，交换和不交 换的比例各为 50%。

var arr = [8, 1, 4, 6, 2, 3, 7, 5]

func sorted(array: [Int], by areInIncreasingOrder: (Int) -> Bool) -> [Int] {
    var resultArr = array
    let randomNum = Int(arc4random())
    for i in 0..<resultArr.count {
        for j in 0..<resultArr.count-1-i {
            if areInIncreasingOrder(randomNum) {
                if resultArr[j] > resultArr[j+1] {
                    resultArr.swapAt(j, j+1)
                }
                
            }
        }
    }
    return resultArr
}

//  2. 列出 sort(by:) 方法接受闭包最复杂的版本到最简单的版本。
let sortedArr1 = sorted(array: arr, by: { (a) -> Bool in return a % 2 == 1})

let sortedArr2 = sorted(array: arr, by: { (a) -> Bool in a % 2 == 1})

let sortedArr3 = sorted(array: arr, by:  { a -> Bool in a % 2 == 1})

let sortedArr4 = sorted(array: arr, by: { $0 % 2 == 1})

let sortedArr5 = sorted(array: arr) { $0 % 2 == 1}

sortedArr1
sortedArr2
sortedArr3
sortedArr4
sortedArr5

//  3. 自己实现一个可以使用结尾闭包的函数，并分别用结尾闭包和非结尾闭包的方式调用它。
func someFuncation(_ numA: inout Int, _ numB: inout Int, isSwap: (Int, Int) -> Bool) {
    var temp = 0.0
    if isSwap(numA, numB) {
        temp = Double(numA)
        numA = numB
        numB = Int(temp)
    }
}

var num1 = 2
var num2 = 1
//结尾闭包：
someFuncation(&num1, &num2) { (a, b) -> Bool in return a > b }
//非结尾闭包：
someFuncation(&num1, &num2, isSwap: {(a, b) in a > b })
someFuncation(&num1, &num2, isSwap: >)
num1
num2


//  4. 研究数组的 map/filter/reduce 方法。每个方法提交一个使用的例子。
//  (1)map(遍历):
let numbers = [1, 2, 3, 4, 5]
var sumNumbers = numbers.map { number in
    number + number
}
//上式等价于:  var sumNumber = numbers.map() { $0 + $0 }
//var sumNumber = numbers.map(+)
sumNumbers

//  (2)filter(遍历，过滤作用不改变自身值):
let filterNum = numbers.filter { (item) -> Bool in
    return item >= 2
}
numbers
filterNum

//  (3)reduce(遍历，有初始值，包含map):
let reduceNum = numbers.reduce(1) { (initResult, partialResult) in
    return initResult * partialResult
}

//  5. 使用 reduce 实现 map 和 filter 的功能。

//  (1)使用 reduce 实现 filter 功能
let reduceNum1 = numbers.reduce(1) { (initResult, partialResult) in
    if partialResult >= 3 {
        return initResult * partialResult
    } else {
        return 1
    }
}

//  (2)使用 reduce 实现 map 功能
let redcueNum2 = numbers.reduce(0) { $0 + $1 }
redcueNum2




//三. 可选型
//1. 简述对 Swift 可选型 的理解。
//2. 声明一个可选型变量，并使用 if let 将其解包。
var aOptionalString: String? = "I'm a string"
if let someStr = aOptionalString {
    print(someStr)
}

//3. 完成一个求数组最大值的函数，考虑到数组为空的情况，返回值应该为可选型(Int、Double、Float 均可)。
func maxValueInArray(of array: [Int]) -> Int? {
    var maxValue: Int? = array.first
    if maxValue != nil {
        for item in array {
            if item > maxValue! {
                maxValue = item
            }
        }
    }
    return maxValue
}
maxValueInArray(of: [])
maxValueInArray(of: [1, 4, 5, 2])

//4. 使用 let 声明一个 String 型变量 foo，和一个 String? 型变量 yoo，如果 yoo 为空的话，给 foo 赋值 "yoo" ，否则为 yoo 的值。

var foo: String = ""
let yoo: String? = nil
foo = yoo ?? "yoo"

//5. 将 dict 中 "b" 对应的值赋给 String 类型的变量 heihei 。
let dict = ["a":"first letter", "b": "second one"] as [String: Any]
let heihei: String = (dict["b"] as? String) ?? "There is no key(b) in the dict"
heihei

//6. 将下列代码第 2 行的值解包，赋给 String 类型的变量 hehe 。
let dic = ["a":"first letter", "b": "second one"]
let hehe: String = (dic["a"]?.range(of: "letter")?.description)!
// or：
let heheda: String = (dic["a"]?.range(of: "letter")?.description) ?? "没有值"









