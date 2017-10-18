////: Playground - noun: a place where people can play

import UIKit
import Foundation

//.类
//1.定义 个类 Man 。
class Man {
    //    2.给 Man 增加一个静态字符串类型属性 thought ，并赋值为"I'm so strong!"。
    static var thought: String = "I'm so strong!"
    
    //3.给 Man 增加一个静态方法 func shoutLoudly() -> Void ，将 thought 打印出来。
    static func shoutLoudly() -> Void {
        print(thought)
    }
    
    //4.给 Man 增加一个非静态布尔类型属性 isGay 。
    var isGay: Bool
    
    //5.给 Man 增加一个构造函数 init(name: String) ，传进去一个字符 ，如果这个参数等于"Halcao"，isGay 为真; 否则 isGay 为假。
    init(name: String) {
        if name == "Halcao" {
            isGay = true
        } else {
            isGay = false
        }
    }
    
    //6.给 Man 增加一个构造函数 init() ， isGay 默认为真。
    init() {
        isGay = true
    }
}

//7.定义一个类 HandsomeMan ，继承自 Man 类。
class HandsomeMan : Man {
    
    //8.给 HandsomeMan 增加一个非静态字符串类型属性 accept 为"Come on Baby!"，增加一个非静态字符串类型属性 refuse 为"No gay! No gay!"。
    var accept: String = "Come on Baby!"
    var refuse: String = "No gay! No gay!"
    
    //9.给 HandsomeMan 增加一个非静态方法 date() ，如果 isGay 为真，则打印 accept ;否则，打印 refuse 。
    func date() {
        if isGay == true {
            print(accept)
        } else {
            print(refuse)
        }
    }
    
    //10.给 HandsomeMan 增加一个非静态字符串成员变量  hisPerfectName 。
    var hisPerfectName: String
    
    //11.给 HandsomeMan 添加一个非静态布尔成员变  hasGirlFriend 。
    var hasGirlFriend: Bool
    
    // 12.给 HandsomeMan 增加一个构造函数 init(name: String, isSingleDog: Bool) ，将 name 的值赋给 hisPerfectName ，将 isSingleDog 的值的否定赋给 hasGirlFriend 。
    init(name: String, isSingleDog: Bool) {
        hisPerfectName = name
        hasGirlFriend = isSingleDog
        super.init()
    }
    
    //13.给 HandsomeMan 增加 个构造函数 init() ，使得 hisPerfectName 的默认值 为""， hasGirlFriend 的默认值为假。
    override init() {
        hisPerfectName = ""
        hasGirlFriend = false
        super.init()
    }
}

//PS：出现的问题：
//1.第十二题为何注释掉super.init()后会出现：  error： super.init isn't called on all paths before returning from initializer，为何必须调用父类init方法
//2.第13题不写override会报错，在子类中该如何添加与父类同名的方法呢


// 复习
var dic: [String: Int] = ["AllenX": 28, "Halcao": 34, "Jin Hongxu": 12, "Billy Herrington": 65, "Apple": 34, "Big Brother": 12]
// 遍历以上字典，将最大的 value 所对应的 key 打印出来

//方法一 ：
let newdic = dic.sorted { (a, b) -> Bool in
    a.value > b.value
}

print(newdic.first!.key)

//方法二 ：
var maxValue = dic.first?.value
for value in dic.values {
    if value > maxValue! {
        maxValue = value
    }
}

for (key, value) in dic {
    if value == maxValue {
        print(key)
    }
}







