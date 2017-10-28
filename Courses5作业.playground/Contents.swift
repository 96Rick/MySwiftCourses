//: Playground - noun: a place where people can play

import UIKit

// 类：
//     * 两个类: 普通玩家(NormalPlayer)/RMB玩家(RichPlayer), 两个枚举：怪物类型(Monster)/职业(Profession)，一个结构体：经验(ExpTimes)
//     * 继承: RichPlayer 继承 NormalPlayer
//     * 重写、多态: RichPlayer 里的两个方法使用了 override 重写 （Line：69,80）
//     * 便利构造器:（Line：97）
//     * 属性观察器: 监测exp的值，如果exp大于2000，isGreenHand 为false (Line：32)

struct ExpTimes {
    var isOpen = false
    var times = 1
}

enum Monster: Int {
    case sheep = 10,
         pig = 50,
         snake = 200,
         lion = 500
}

enum Profession: String {
    case Hunter
    case warrior
}

class Normalplayer {
    var name = ""
    var isGreenHand = true
    var exp = 0 {
        didSet {
            if exp >= 2000 {
                isGreenHand = false
            }
        }
    }
    
    func idle() {
        exp += 500
        print("------ 挂机成功! ------ \n获得500EXP 总经验为\(exp)EXP\n\n")
    }
    func kill(monster: Monster) {
        let getExp = monster.rawValue
        if isGreenHand {
            
            exp += getExp
            print("------ 成功猎杀(\(monster)) ------\n获得\(getExp)EXP 总经验为\(exp)EXP\n\n")
        } else {
            
            switch monster {
            case .sheep:
                print("----------  注意⚠️  ---------- \n你已不是新手，请不要虐杀可爱的 Sheep！\n\n")
            case .pig:
                print("----------  注意⚠️  ---------- \n你已不是新手，请不要虐杀可爱的 Pig！\n\n")
            case .snake:
                exp += getExp
                print("------ 成功猎杀(\(monster)) ------\n获得\(getExp)EXP 总经验为\(exp)EXP\n\n")
            case .lion:
                exp += getExp
                print("------ 成功猎杀(\(monster)) ------\n获得\(getExp)EXP 总经验为\(exp)EXP\n\n")
            }
        }
        
    }
}

class RichPlayer: Normalplayer {
    var expTimes = ExpTimes()
    override func idle() {
        switch expTimes.isOpen {
        case true:
            exp += 500 * expTimes.times
            print("------ ￥挂机完成￥ ------ \n当前服务器经验倍数奖励为:\(expTimes.times)倍 获得\(500 * expTimes.times)EXP 总经验为\(exp)EXP\n\n")
        case false:
            exp += 500
            print("------ ￥挂机完成￥ ------ \n当前服务器未开启经验倍数奖励 获得\(500 * expTimes.times)EXP 总经验为\(exp)EXP\n\n")
        }
    }
    
    override func kill(monster: Monster) {
        let kindOfMonster = monster
        if expTimes.isOpen == true {
            let getExp = monster.rawValue * expTimes.times
            exp += getExp
            print("------ ￥成功猎杀(\(kindOfMonster))￥ ------\n当前服务器经验倍数奖励为:\(expTimes.times)倍 获得\(getExp)EXP,当前总经验为\(exp)EXP\n\n")
        } else {
            let getExp = monster.rawValue
            exp += getExp
            print("------ ￥成功猎杀(\(kindOfMonster))￥ ------\n当前服务器未开启经验倍数奖励 获得\(getExp)EXP,当前总经验为\(exp)EWXp\n\n")
        }
    }
    
    init(name: String) {
        super.init()
        self.name = name
    }
    convenience init(playerName: String, profession: Profession) {
        self.init(name: profession.rawValue + " " + playerName)
        print(playerName + " has become a new " + profession.rawValue + "\n\n")
    }
}


let lester = Normalplayer()
lester.exp
lester.isGreenHand
lester.idle()
lester.exp
lester.kill(monster: .lion)
lester.kill(monster: .lion)
lester.kill(monster: .lion)
lester.kill(monster: .pig)
lester.kill(monster: .sheep)

let Rick = RichPlayer(playerName: "Rick", profession: .Hunter)
Rick.idle()
Rick.kill(monster: .lion)
Rick.expTimes.isOpen = true
Rick.expTimes.times = 3
Rick.idle()
Rick.kill(monster: .lion)


// TableView

class TableView {
    var dataSource: TableViewDataSource?
    func printData() {
        let index = IndexPath(row: 0, section: 0)
        var sectionValue = 0
        let separator = "——————————————————"
        if let data = dataSource {
            print(separator)
            for section in 0..<(data.numberOfSection()) {
                for row in 0...(data.numberOfRowsIn(section: section)) {
                    //section值改变时，进行换行打印
                    index.row = row
                    index.section = section
                    if sectionValue != index.section {
                        sectionValue = index.section
                        print("\n\n\(separator)")
                    }
                    print((data.contentForRowAt(indexPath: index)))
                }
            }
        }
    }
}

class IndexPath {
    var isSectionChanged: Bool = false
    var row: Int = 0
    var section: Int = 0
    init(row: Int, section: Int) {
        self.row = row
        self.section = section
    }
}

protocol TableViewDataSource {
    func numberOfSection() -> Int
    func numberOfRowsIn(section: Int) -> Int
    func contentForRowAt(indexPath: IndexPath) -> String
}



class DataProvider: TableViewDataSource {
    func numberOfSection() -> Int {
        return 3
    }

    func numberOfRowsIn(section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 2
        case 2:
            return 2
        default:
            return 0
        }
    }

    func contentForRowAt(indexPath: IndexPath) -> String {

        let separator = "——————————————————"

        switch (indexPath.section, indexPath.row) {
        case (0,0):
            return " ✈️ 飞行模式\n\(separator)"
        case (0,1):
            return " 📡 无线局域网\n\(separator)"
        case (0,2):
            return " 🖱 蓝牙\n\(separator)"
        case (0,3):
            return " 🌐 蜂窝移动\n\(separator)"
        case (1,0):
            return " ⚠️ 通知\n\(separator)"
        case (1,1):
            return " 🕳 控制中心\n\(separator)"
        case (1,2):
            return " ❌ 勿扰模式\n\(separator)"
        case (2,0):
            return " ⚙ 通用\n\(separator)"
        case (2,1):
            return " 💡 亮度\n\(separator)"
        case (2,2):
            return " 🗳 墙纸\n\(separator)"
        default :
            return "somethingInSection"
        }
    }
}

let tableView = TableView()
tableView.dataSource = DataProvider()
tableView.printData()






