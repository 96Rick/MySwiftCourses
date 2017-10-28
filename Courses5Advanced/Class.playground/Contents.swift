//: Playground - noun: a place where people can play

import Cocoa

// 可失败的构造函数
class ClosedRange {
    var upperBound: Int
    var lowerBound: Int
    
    lazy var lazySum: Int = {
        return (self.lowerBound...self.upperBound).reduce(0, +)
    }()
    
    init?(lowerBound: Int, upperBound: Int) {
        guard lowerBound <= upperBound else {
            return nil
        }
        self.lowerBound = lowerBound
        self.upperBound = upperBound
    }
}

// 便利构造函数 + // 可选成员
class Person {
    var fullName: String
    var spouse: Person?
    
    init(fullName: String) {
        self.fullName = fullName
    }

    convenience init(firstName: String, lastName: String) {
        self.init(fullName: firstName + " " + lastName)
    }
}

let halcao = Person(firstName: "hao", lastName: "cao")
let caohao = Person(fullName: "Halcao")

// 引用类型
halcao.spouse = halcao

let anotherHalcao = halcao
anotherHalcao.spouse = nil

halcao.spouse

// 对象的 let 和成员变量的 let

// 多层继承

// 计算型属性

class Point {
    var x: Int
    var y: Int
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

class Size {
    var width: Int
    var height: Int
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
}

class Rect {
    var origin: Point
    var size: Size
    var center: Point {
        return Point(x: origin.x + size.width/2, y: origin.y + size.height/2)
    }
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    convenience init(x: Int, y: Int, width: Int, height: Int) {
        self.init(origin: Point(x: x, y: y), size: Size(width: width, height: height))
    }
}
let rect = Rect(x: 2, y: 2, width: 20, height: 20)



// set get 方法
class LightBulb {
    var power: Int = 0 {
        willSet {
            print("will set power as \(newValue)")
        }
        didSet {
            if power > LightBulb.maxPower {
                power = LightBulb.maxPower
            }
        }
    }
    static let maxPower = 30
    init(power: Int) {
        self.power = power
    }
    
    func setPower(power: Int) {
        guard power <= LightBulb.maxPower else {
            return
        }
        self.power = power
    }
}

// 不会在初始化的时候加载
let bulb = LightBulb(power: 10)
bulb.power

bulb.power = 100
bulb.power


// Lazy Property 懒加载

extension ClosedRange {
    var sum: Int {
        return (lowerBound...upperBound).reduce(0, +)
    }
}

// 继承

// 写个 demo

// final

// 多态 Polymorphism

// 重写 Override

// required

protocol DataSourceProtocol {
    var data: [Int] { get }
    func printData()
}

class RandomDataGenerator: DataSourceProtocol {
    var data: [Int] {
        return [1, 2, 3, 4, 5].sorted(by: { _, _ in
            arc4random() % 2 == 0
        })
    }
    func printData() {
        for item in data {
            print(item)
        }
    }
}

class Sorter {
    var dataProvider: DataSourceProtocol?
    func sort() {
        if let provider = dataProvider {
            print(provider.data.sorted())
        }
    }
}

let sorter = Sorter()
let generator = RandomDataGenerator()
sorter.dataProvider = generator
sorter.sort()
sorter.dataProvider?.printData()


class Creature {
    var name: String
    var type: String {
        return "Creature"
    }
    var isAlive: Bool = true
    var life = 100 {
        didSet {
            if life <= 0 {
                isAlive = false
                life = 0
            } else {
                isAlive = true
            }
        }
    }
    
    var description: String {
        return name + " \(life)"
    }
    
    init(name: String) {
        self.name = name
    }
    
    func beAttacked(attack: Int) {
        print("User: \(self.name) is attacked by \(attack)!")
        life -= attack
    }
}

class User: Creature {
    var score = 0 {
        didSet {
            print("User: \(self.name) got \(self.score-oldValue) score!")
            level = self.score/30
        }
    }
    var level = 0 {
        didSet {
            if oldValue != level {
                print("User: \(self.name) level up to \(self.level)!")
            }
        }
    }

    func getScore(score: Int) {
        self.score += score
    }
}

class Shooter: User {
    var gun: String?
    override var type: String {
        return "Shooter"
    }
}

class Warrior: User {
    var weapon: String?
    override var type: String {
        return "Warrior"
    }
}

class Monster: Creature {
    static let maxAttackAmount = 10
    func attack(user: User) {
        let amount = Int(arc4random()) % Monster.maxAttackAmount
        user.beAttacked(attack: amount)
    }
}

class Zombie: Monster {
    override var type: String {
        return "Zombie"
    }
    override func attack(user: User) {
        super.attack(user: user)
        print("Zombie extra hurt")
    }
}
class Slime: Monster {
    override var type: String {
        return "Slime"
    }
}


let player1 = Shooter(name: "Halcao")
let player2 = Warrior(name: "caohao")

let zombie = Zombie(name: "Zombie")
let slime = Slime(name: "Slime")

zombie.attack(user: player1)
player1.getScore(score: 15)
player1.level





