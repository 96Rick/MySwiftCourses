//: Playground - noun: a place where people can play

import UIKit



//Que1:声明两个字符串，用+号链接，并使用 lowercased() 方法使所有字幕变为小写字母
var name = "Rick"
var language = "Swift&Object-C"
var str = name + "'s favorite language is " + language
var str2 = str.lowercased()
print(str)
print(str2)

//Que2:for in 循环计算10的阶乘
var n = 1
for i in 1...10 {
    n*=i
}
print(n)

/*
n = 1
for j in 1..<11 {
    n *= j
}
print(n)
*/

//Que3:声明一个空字典，用for-in循环，添加10个任意的不同键值对
var stuDic = Dictionary<String,Int>()
for index in 1...10 {
    var student : String = "学生"
    student += String(index)
    stuDic[student] = index+1000
}
for (key,value) in stuDic {
    print("\(key) 学号 :（\(value)）")
}

/*
 
func appendStudentNumber(name:String,number:Int) {
     stuDic[name] = 1000+number
}
 appendStudentNumber(name: "学生不正经", number: Int.min)
 
 */


