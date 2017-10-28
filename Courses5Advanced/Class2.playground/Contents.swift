
//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

// 可空的构造函数
// Lazy Property
class ClosedRange {
    var lowerBound: Int
    var upperBound: Int
    
    lazy var sum: Int = {
        print("string")
        return (self.lowerBound...self.upperBound).reduce(0, +)
    }()
    
    init?(lowerBound: Int, upperBound: Int) {
        guard lowerBound <= upperBound else {
            return nil
        }
        
        print("\(lowerBound)...\(upperBound)")
        self.lowerBound = lowerBound
        self.upperBound = upperBound
        
//        sum = (lowerBound...upperBound).reduce(0, +)
    }
}

let range = ClosedRange(lowerBound: 2, upperBound: 1)
let range2 = ClosedRange(lowerBound: 1, upperBound: 2000)


range2?.sum
range2?.sum
range2?.sum
range2?.sum
range2?.sum

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
    let size: Size
    var center: Point {
        return Point(x: origin.x + size.width / 2, y: origin.y + size.height / 2)
    }
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
}

let rect =  Rect(origin: Point(x: 100, y: 100), size: Size(width: 200, height: 200))

rect.center
rect.origin = Point(x: 0, y: 0)
rect.center

class People {
    var spouse: People?
    var name: String
    init(name: String) {
        self.name = name
    }
}

let xiaoming = People(name: "xiaoming")
xiaoming.spouse = People(name: "laowang")
let daming = xiaoming
daming.spouse = nil
xiaoming.spouse

class LightBulb {
    var power: Int {
        set {
            print(newValue)
        }
        get {
            return 100
        }
//        willSet {
//            print("newValue: \(newValue)")
//        }
//        didSet {
//            print("oldValue: \(oldValue)")
//            guard self.power <= LightBulb.maxPower else {
//                self.power = oldValue
//                return
//            }
//        }
    }
    static let maxPower = 30
    init(power: Int) {
        self.power = power
    }
    
    func setPower(power: Int) {
    }
}

let bulb = LightBulb(power: 10)
//bulb.setPower(power: 40)
bulb.power = 40
bulb.power

// 便利构造器
class Person: NSObject {
    var fullName: String
    
    // fullName == firstName + " " + lastName
    init(fullName: String) {
        self.fullName = fullName
        super.init()
    }
    
    convenience init(firstName: String, lastName: String) {
        self.init(fullName: firstName + " " + lastName)
    }
}

Person(firstName: "hao", lastName: "cao")

class Creature {
    var name: String
    var type: String {
        return "Creature"
    }
    var isAlive: Bool = true
    var life = 100 {
        didSet {
            if life < 0 {
                isAlive = false
                life = 0
            } else {
                isAlive = true
            }
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
    func beAttacked(attack: Int) {
        life -= attack
        print("User \(name) is attacked by \(attack)")
    }
}

class User: Creature {
    var score = 0 {
        didSet {
            level = self.score / 30
        }
    }
    var level = 0 {
        didSet {
            if level > oldValue {
                print("User: [\(name)] level up.")
            }
        }
    }
    override var type: String {
        return "User"
    }
    
    func getScore(score: Int) {
        self.score += score
    }
}
//let creature = Creature(name: "234")
//creature.type
//
//let user = User(name: "123")
//user.type

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
    override var type: String {
        return "Creature"
    }

    func attack(user: User) {
        let amount = Int(arc4random()) % (Monster.maxAttackAmount + 1)
        user.beAttacked(attack: amount)
    }
}

class Zombie: Monster {
    override var type: String {
        return "Zombie"
    }

    override func attack(user: User) {
        let amount = Int(arc4random()) % (Monster.maxAttackAmount + 1)
        user.beAttacked(attack: amount*2)
    }
}

final class Slime: Monster {
    override var type: String {
        return "Slime"
    }

    override func attack(user: User) {
        let amount = Int(arc4random()) % (Monster.maxAttackAmount + 1)
        user.beAttacked(attack: amount/2)
    }
}

let slime1 = Slime(name: "a")
let player1 = Shooter(name: "b")
let player2 = Warrior(name: "c")
slime1.attack(user: player1)
slime1.attack(user: )

let array: [Creature] = [slime1, player1, player2]

array[1].type
for creature in array {
    if let creature = creature as? Shooter {
        print(creature.level)
    }
    if creature is Shooter {
        print((creature as! Shooter).life)
    }
}


// Override
//var

// Protocol 协议
// Protocol Oriented Programming POP

protocol DataSourceProtocol {
    var data: [Int] { get }
    func printData()
}

// conform 遵守
class RandomDataGenerator: DataSourceProtocol {
    var data: [Int] {
        return [1, 2, 3, 4, 5].sorted { _, _ in
            arc4random() % 2 == 1
        }
    }
    func printData() {
        for i in data {
            print(i)
        }
    }
}

class Sorter {
    var dataProvider: DataSourceProtocol?
    
    func sort() -> [Int]? {
        if let dataProvider = dataProvider {
          return dataProvider.data.sorted()
        }
        return nil
    }
}

let sorter = Sorter()
let provider = RandomDataGenerator()
sorter.dataProvider = provider
sorter.dataProvider?.printData()
sorter.sort()


//let tableView = 

