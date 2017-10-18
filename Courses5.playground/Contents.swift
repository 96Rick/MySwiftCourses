//: Playground - noun: a place where people can play

//Courses5 类，面向对象，属性。

import UIKit

//构造函数:
//可空构造函数
//lazy  计算属性
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
    let origin: Point
    let size: Size
    var center: Point {
        return Point(x: origin.x + size.width / 2, y: origin.y + size.height / 2)
    }
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
}

class People {
    var spouse: People?
    var name: String
    init(name: String) {
        self.name = name
    }
    
}
//let xiaoming = People(name: "xiaoming")
//xiaoming.spouse = People(name: "xiaofang")
//print(xiaoming.spouse!)
//let daming = People(name: "daming")
//daming.spouse = nil
//print(xiaoming.spouse!)

//class LightBulb {
//    var power: Int = 0 {
//        didset {
//
//        }
//    }
//    static let maxPower = 30
//    init(power: Int) {
//        self.power = power
//    }
//
//    func setPower(power: Int) {
//        guard power <= LightBulb.maxPower else {
//            return
//        }
//        self.power = power
//    }
//
//}
//
//let bulb = LightBulb(power: 20)
//bulb.setPower(power: 40)

//class Creature {
//    var name: String
//    var type: String {
//        return "Creature"
//    }
//    var isAlive: Bool = true
//    var life = 100 {
//        didset {
//
//        }
//    }
//    init(name: String) {
//        self.name = name
//    }
//    func beAttacked(attack: Int) {
//        life -= attack
//    }
//}
//
//class User: Creature {
//
//}

//protocol 协议
protocol DataSourceProtocol {
    var data: [Int] { get }
    func printData()
    
}

// conform protocol
class RandomDataGenerator: DataSourceProtocol {
    var data: [Int] {
        return [1, 2, 3, 4, 5].sorted {_,_ in
            arc4random() % 2 == 1
        }
    }
    
    
    func printData() {
        for i in data {
            print(i)
        }
    }

}



let tableView = UITableView(frame: CGRect, style: UITableViewStyle)






