//: Playground - noun: a place where people can play

import UIKit


var someInts = [Int]()


var faf : Set = ["a","b","a"]

var ariports : [String : String] = ["Rick":"student","adf":"asdf"]

print("The Number Of AirPorts is \(ariports.count)")

ariports["Rick"] = "Hi"

let dickey = [String](ariports.keys)

var someArray: Array = [Int]()
var emptyDict2: [String:Int] = [:]

var httpStatus = (status: "Not Found", code: 404)

httpStatus.status = ""

httpStatus.status 

var emptyArray = [Int]()
let emptyDictionary = Dictionary<String,Int>()

emptyArray = []

var dic : Dictionary<String,Int> = ["food":1,"number":2]


let interestingNums = [
    "Prime" : [1,4,74,74,3,53,52,24],
    "Fibonacci" : [1,1,2,3,5,8],
    "square" : [1,4,9,16,25,36],
]
var largest = 0
for (kind,numbers) in interestingNums {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
largest


var n = 2
while n < 100 {
    n*=2
}

repeat {
    n+=4
} while n < 200

func greet(name:String,whatForLunch:String) -> String {
    return "Hello. My name is \(name), I have \(whatForLunch) for lunch"
}

greet(name: "Rick", whatForLunch: "Beef")

func todo(name:String,numberOfThings:Int,things:String)
{
    print("Hi my name is \(name), I have \(numberOfThings) Things to do , the first thing is \(things)")
}

todo(name: "Rick", numberOfThings: 4, things: "eat")

func getFloat() -> (Float,Float,Double)
{
    return (2.1,3.4,4.1)
}
getFloat()

//可以传入多个参数值
func sumNum(numbers:Int...) -> Int{
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
print(sumNum(numbers: 1,1,2,3))

func average(numbers:Float...) -> Float{
    var sum : Float = 0
    var counts : Int = 0
    for number in numbers {
        counts += 1
        sum += number
    }
    let result = sum/Float(counts)
    return result
}

print(average(numbers: 1.2,1.2,1.2,1.2))


// 函数嵌套
func makeIncrementer() -> ((Int) -> Int){
    func addOne(number:Int) -> Int {
        return number + 1
    }
    return addOne
}

 var incrementer = makeIncrementer()
incrementer(8)

let point = (3,-3)

switch point {
case (let x , 0):
    print("on the x-axis with a x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case (let x, let y) where x == y :
    print("\(x), \(y) is on the line x == y")
case (let x, let y) where x == -y:
    print("\(x), \(y) is on the line x == -y")
case (let x,let y):
    print("somewhere at \(x), \(y)")
    
}


