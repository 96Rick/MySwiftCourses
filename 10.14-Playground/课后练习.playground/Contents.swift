
//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

// M: method V: variable
var arr = [1, 4, 5, 2, 6]
//arr.sort(by: >)
let newArr = arr.sorted()
newArr
arr
//arr.sort(by: <#T##(Int, Int) -> Bool#>)
arr.sort(by: <)
arr

func areInIncreasingOrder(a: Int, b: Int) -> Bool {
    if a < b {
        return true
    } else {
        return false
    }
}



let areInIncreasingOrderClosure: (Int, Int) -> Bool = { a, b in
    if a < b {
        return true
    } else {
        return false
    }
}

areInIncreasingOrderClosure(2, 1)

areInIncreasingOrder(a: 2, b: 1)
//arr.sort(by: areInIncreasingOrder)
//arr.sort { $0 < $1 }


arr.sort { $0 < $1 }
// 1 2
//(Int, Int) -> Bool
arr.sort(by: >)

func sorted(array: [Int], by areInDecreasingOrder: (Int, Int)->(Bool)) -> [Int] {
    var items = array
    for i in 0..<items.count {
        for j in 0..<items.count-1-i {
            if areInDecreasingOrder(items[j], items[j+1]) {
                swap(&items[j], &items[j+1])
            }
        }
    }
    return items
}


// map filter reduce
// map 映射

let array = [1, 2, 3, 4, 5]

array.map { a in
    return a * a
}


func myMap(array: [Int], transform: (Int) -> Int) -> [Int] {
    var newArray: [Int] = []
    for item in array {
        let newValue = transform(item)
//        print(item)
        newArray.append(newValue)
    }
    return newArray
}

myMap(array: [1, 2, 3, 4, 5], transform: { $0 * $0 })

let strArr = ["123", "1", "1234"]

let charCount = strArr.map { $0.characters.count }

strArr.filter { $0.characters.count >= 2 }

[1, 2, 3, 4, 5].reduce(1) { currentResult, currentValue in
    return currentResult * currentValue
}

[1, 2, 3, 4, 5].reduce(0) { currentResult, currentValue in
    return currentResult + currentValue
}

[1, 2, 3, 4, 5].reduce(1, *)

// 用 reduce 实现 map filter


let emptyArray: [Int] = []
var nilArray: [Int]? = nil
nilArray
emptyArray

emptyArray.first

// UInt32: Unsigned Int 32
arc4random() % 2 == 1

var closureArray: [(Void)->Void] = []

func ddd(closure: @escaping (Void)->Void) {
    closureArray.append(closure)
}

//ddd(closure: { print("123") })


print("456")

closureArray.first?()

// as
//let intValue: Any =


