//: Playground - noun: a place where people can play

import UIKit
var dic1: [String:Int] = [:]
var array = [Int]()
let emptyDic = [String:Int]()
emptyDic.isEmpty



/*

var counter = 1, finalSignal = 5

while counter <= finalSignal {
    print("The counter number is \(counter)")
    counter += 1
}

print("out the loop")

counter = 1
finalSignal = 5
repeat {
    print("The counter number is \(counter)")
    counter += 1
} while counter <= finalSignal


var temperature = 32
if temperature <= 20 {

} else {
    print("else")
}

var character : Character = "z"
switch character {
case "a":
    print("is a")
    break
case "b":
    print("is b")
    break
case "c":
    print("is c")
    break
default:
    print(character)
    break
}
class name {

}

class WidgetContainer {
    var widgetButton : UIButton!
    let widgetHeightPercentage = 0.85
    
    init() {
        
    }
}

var array = [1,2,3,4,5]
array[2...]


var dict : [String:String] = [:]

//json
//{
//    "title" : "news"
//    "content" : "hahahahahahahahh"
//}

dict["title"] = "news"
dict["content"] = "hahah"

let set : Set = [1,3,2]

*/


func primeNum(number : Int) {
    var resultStr = ""
    if (number < 2) {
        print("Please input a number greater than 2")
        return
    }
    for i in 2...(number - 1) {
        if (number % i == 0) {
           resultStr = "is not a PrimeNum"
            break
        } else if (i == number - 1) {
           resultStr = "is a PrimeNum"
        }
    }
    print(resultStr)
    return
}
primeNum(number: 11)










