
import UIKit

//MARK: - 使用函数实现输入,完成排序,可以使用Int/Double/Float/... 替换String

func BubbleSort(input: String...) -> [String] {
    var resultArrary = [String]()
    for index in input {
        resultArrary.append(index)
    }
    
    for i in 0..<resultArrary.count {
        for j in 0..<resultArrary.count - (i+1) {
            if resultArrary[j] > resultArrary[j+1] {
                let temp = resultArrary[j]
                resultArrary[j] = resultArrary[j+1]
                resultArrary[j+1] = temp
            }
        }
    }
    
    return resultArrary
}

print(BubbleSort(input: "Button", "battery", "Action", "Optional", "alcohol", "Attention", "Captain", "Zombies", "playground", "zero", ""))


