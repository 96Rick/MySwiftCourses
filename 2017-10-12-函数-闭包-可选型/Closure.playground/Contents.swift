//: Playground - noun: a place where people can play

import Cocoa

// MARK: Closure

// 匿名函数
// 闭包的应用场景

func foreach(array: [Int], function: (Int)->()) {
    for item in array {
        function(item)
    }
}

func once(item: Int) {
    print(item)
}

let array = [1, 2, 3, 4]
foreach(array: array, function: { (item: Int) in
    print(item)
})

foreach(array: array, function: once)

array.reduce([], { result, item in
    return result + [item]
})

array.reduce([], { result, item in
    return result + (true ? [item] : [])
})

array.sorted(by: { $0 > $1 })

func sorted(array: [Int], by method: (Int, Int)->(Bool)) -> [Int] {
    var items = array
    for i in 0..<items.count {
        for j in 0..<items.count-1-i {
            if method(items[j], items[j+1]) {
                items.swapAt(j, j+1)
            }
        }
    }
    return items
}

let s = sorted(array: [3, 5, 2, 9], by: >)
s

// Escaping Closure
// 在函数返回之后执行的闭包

var yiGeShuZu = [()->()]()

class SomeClass {
    var x = 5
    func someFunction(closure: ()->()) {
        print(closure)
    }
}


