//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"
// M: method, V: variable

var arr = [1, 6, 3]

arr.sort()

// map filter reduce
// map 映射
let array = [1, 3, 2, 5, 4]
print(array.map() { $0 * $0 })
print(array.map { (item) -> Int in
    item * item
})

let strArr = ["123", "1", "1324"]
let charCount = strArr.map { $0.characters.count}

// filter:
//strArr.filter { string in
//    if string.characters.count >= 2 {
//        return true
//    }
//}

array.reduce(1) { (currentResult, currentValue) in
    return currentResult * currentValue
}

array.reduce(0, +)

let emptyArray: [Int] = []
var nilArray: [Int]? = nil


UIColor.red.description

// as








