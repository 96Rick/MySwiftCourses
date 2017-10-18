//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


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
//
//
//let xiaoming = People()
//let rice = Food(name: "rice")
//xiaoming.eat(food: rice)

// 类 属性行为
class Animal {
    var name: String
    func run() {
        print(name + " run")
    }
    
    func breathe() {
        print(name + " breathe " )
    }
    init(name: String) {
        self.name = name
    }
    
    //析构函数
    deinit {
        print("deinit")
    }
}

let tiger = Animal(name: "Fat")

tiger.breathe()
tiger.run()

// 继承：
//类方法可以在属性方法中被调用，方法属性不可以被类方法调用
//单例


class People: Animal {
    static var className: String = "人类"
    static func classMethod() {
        print("123")
    }
    var haircut: String
    func talk() {
        print(name + "talk")
        People.classMethod()
    }
    init(haircut: String, name: String) {
        self.haircut = haircut
        super.init(name: name)
    }
}

//protected private public fileprivate
let xiaoming = People(haircut: "a", name: "xiaoming")

xiaoming.name
People.className
People.classMethod()
xiaoming.talk()
