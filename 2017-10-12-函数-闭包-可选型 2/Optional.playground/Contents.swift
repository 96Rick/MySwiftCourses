//: Playground - noun: a place where people can play

import Cocoa

// MARK: Optional Type

// 可选型的引入 -> 错误处理


var errorMessage = "Bad Gateway"

errorMessage = ""

errorMessage.isEmpty

// C++
// How to set errorMessage true nil

// let favoriteNumber = 0

// What if I don't have a favorite number

var favoriteNumber: Int? = 0
favoriteNumber = nil

favoriteNumber = 5

favoriteNumber

favoriteNumber == nil

favoriteNumber!

if favoriteNumber != nil {
    print("\(favoriteNumber!)")
}

if let newNumber = favoriteNumber {
    
}

/// 等价于

if favoriteNumber != nil {
    let newNumber = favoriteNumber!
}

if let favoriteNumber = favoriteNumber {
    
}

if var favoriteNumber = favoriteNumber {
    
}

//guard let favoriteNumber = favoriteNumber else {
//    break
//}

let str: String? = "123"
str?.uppercased()

str?.range(of: "1")?.description

str!.range(of: "1")

let s = str ?? "456"
let b = str == nil ? "456" : str!
let a = nil ?? "345"

let intValue = Int("123")

let anyArray: [Any] = ["123", 456]

//let e1 = Int(anyArray[0])
let e1 = anyArray[0] as? Int
let e2 = anyArray[0] as? String

let hidden: String!

//hidden = "12"

hidden