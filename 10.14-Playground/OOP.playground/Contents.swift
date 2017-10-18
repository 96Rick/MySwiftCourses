
//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

// OOP Object-Oriented-Programming
// POP Procedure-Oriented-Programming

func eat(people: String, food: String) {
    print(people + " eat " + food)
}

//eat(people: "213", food: "dsjsks")

// 
//class People {
//    func eat(food: Food) {
//        print("I eat " + food.name)
//    }
//}
//
//class Food {
//    var name: String
//    init(name: String) {
//        self.name = name
//    }
//}

//let xiaoming = People()
//let rice = Food(name: "rice")

//xiaoming.eat(food: rice)


// 人 老虎
// mammal 动物 
// 属性 行为
// breathe

class Animal {
    var name: String
    func breathe() {
        print(name + " breathe")
    }
    func run() {
        print(name + " run")
    }
    
    // init 构造方法 必须要有
    init(name: String) {
        self.name = name
    }
    
    // deinit 析构函数
//    deinit {
//        print("deinit")
//    }
}

// 继承

class People: Animal {
    static var className: String = "人类"
    static func classMethod() {
        
        print("123")
    }
    var haircut: String
    func talk() {
        People.classMethod()
        print(name + " talk")
    }
    func think() {
        print(name + " think")
    }
    init(name: String, haircut: String) {
        self.haircut = haircut
        super.init(name: name)

//        name = name
    }
}

class AClass {
    var prop: String!
    func p() {
        prop = ""
    }
}

let a = AClass()
a.p()
a.prop

// protected private public fileprivate

//let xiaoming = People(name: "Xiaoming")

//xiaoming.name
//xiaoming.run()

//let tiger = Animal(name: "Fat")
//
//tiger.breathe()
//tiger.name

let xiaoming = People(name: "Xiaoming", haircut: "a")
People.className
People.classMethod()
xiaoming as Animal
//if let xiaomingAnimal = xiaoming as? Animal {
//    xiaomingAnimal.breathe()
//}

let anyArray: [Any] = ["124", 12]

let aa = anyArray[1]

if let aaInt = aa as? Int {
    aaInt
} else {

}

"123" as Any

//"123".replacingOccurrences(of: , with: )

// www.stackoverflow.com
