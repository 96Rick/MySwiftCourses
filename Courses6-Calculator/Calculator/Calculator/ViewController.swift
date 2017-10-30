//
//  ViewController.swift
//  Calculator
//
//  Created by Rick on 2017/10/28.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit
import Foundation



class ViewController: UIViewController {
    var operand1: Double = 0 // left operand
    var operand2: Double = 0  // right operand
    var Operator: String = ""  // operator:+-*/=
    var inPutString: String = ""
    
    
    
    
    let kScreenHeight = Int(UIScreen.main.bounds.height)
    let kScreenWidth = Int(UIScreen.main.bounds.width)
    let btnSideLength = Int(UIScreen.main.bounds.width / 4)
    let resultLabelRectHeight = Int(UIScreen.main.bounds.height - ((UIScreen.main.bounds.width / 4) * 5))
    let resultLabelRectWidth = Int(UIScreen.main.bounds.width)
    var fontSize = 0
    
    var labelResultBottom: UILabel!
    var labelResultTop: UILabel!
    var labelOperators: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black

        print(kScreenHeight)
        switch kScreenHeight {
        case 568: //ipse/5s/5
            fontSize = 32
        case 667: //ip8/7/6
            fontSize = 38
        case 736: //ip8s/7s/6s
            fontSize = 42
        case 812: //ipx
            fontSize = 46
        default:
            fontSize = 100
        }
        print(fontSize)
        
        labelResultBottom = UILabel(frame: CGRect(x: 0, y: resultLabelRectHeight / 2, width: resultLabelRectWidth - 20, height: resultLabelRectHeight / 2))
        labelResultBottom.backgroundColor = UIColor.black
        labelResultBottom.textColor = UIColor.white
        labelResultBottom.textAlignment = .right
        labelResultBottom.font = UIFont.systemFont(ofSize: CGFloat(fontSize + 15))
        labelResultBottom.text = "0"
        self.view.addSubview(labelResultBottom)
        
        labelResultTop = UILabel(frame: CGRect(x: 0, y: 20, width: resultLabelRectWidth - 20, height: resultLabelRectHeight / 2))
        labelResultTop.backgroundColor = UIColor.black
        labelResultTop.textColor = UIColor.white
        labelResultTop.textAlignment = .right
        labelResultTop.font = UIFont.systemFont(ofSize: CGFloat(fontSize - 5))
        labelResultTop.text = ""
        self.view.addSubview(labelResultTop)
        
        labelOperators = UILabel(frame: CGRect(x: 0, y: 30, width: btnSideLength / 2, height: btnSideLength - 30))
        labelOperators.backgroundColor = UIColor.black
        labelOperators.textColor = UIColor.white
        labelOperators.textAlignment = .center
        labelOperators.font = UIFont.systemFont(ofSize: CGFloat(fontSize + 6))
        labelOperators.text = ""
        labelResultBottom.addSubview(labelOperators)
        
        let numArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        var numIndex = 0
        for i in 1..<4 {
            for j in 0..<3 {
                let button = UIButton(type: .custom)
                button.frame = CGRect(x: btnSideLength * j, y: resultLabelRectHeight + btnSideLength * i, width: btnSideLength, height: btnSideLength)
                button.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
                print(numArray[numIndex])
                button.isEnabled = true
                button.setBackgroundImage(UIImage(named: "keypad_button_darker_background"), for: UIControlState.normal)
                button.titleLabel!.textColor = UIColor.blue//titleLabel?.titleColor(for: UIControlState.normal) = UIColor.gray
                button.setTitleColor(UIColor.black, for: UIControlState.normal)
                button.setTitleColor(UIColor.white, for: UIControlState.highlighted)
                button.layer.masksToBounds = true
                button.layer.borderWidth = 0.5
                button.layer.borderColor = UIColor.darkGray.cgColor
                button.setTitle(numArray[numIndex], for: UIControlState.normal)
                button.addTarget(self, action: #selector(onClick(sender:)), for: UIControlEvents.touchUpInside)
                self.view.addSubview(button)
                
                numIndex += 1
            }
        }
        
        let buttonZero = UIButton(type: .custom)
        buttonZero.frame = CGRect(x: 0, y: resultLabelRectHeight + btnSideLength * 4, width: btnSideLength * 2, height: btnSideLength)
        buttonZero.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        buttonZero.setTitle("0", for: UIControlState.normal)
        buttonZero.setBackgroundImage(UIImage(named: "keypad_button_darker_background"), for: UIControlState.normal)
        buttonZero.setTitleColor(UIColor.black, for: UIControlState.normal)
        buttonZero.setTitleColor(UIColor.white, for: UIControlState.highlighted)
        buttonZero.layer.masksToBounds = true
        buttonZero.layer.borderWidth = 0.5
        buttonZero.layer.borderColor = UIColor.darkGray.cgColor
        buttonZero.addTarget(self, action: #selector(onClick(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(buttonZero)

        let buttonPoint = UIButton(type: .custom)
        buttonPoint.frame = CGRect(x: btnSideLength * 2, y: resultLabelRectHeight + btnSideLength * 4, width: btnSideLength, height: btnSideLength)
        buttonPoint.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        buttonPoint.setTitle(".", for: UIControlState.normal)
        buttonPoint.setBackgroundImage(UIImage(named: "keypad_button_darker_background"), for: UIControlState.normal)
        buttonPoint.setTitleColor(UIColor.black, for: UIControlState.normal)
        buttonPoint.setTitleColor(UIColor.white, for: UIControlState.highlighted)
        buttonPoint.layer.masksToBounds = true
        buttonPoint.layer.borderWidth = 0.5
        buttonPoint.layer.borderColor = UIColor.darkGray.cgColor
        buttonPoint.addTarget(self, action: #selector(onClick(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(buttonPoint)
        
        let operatorArray = ["÷", "×", "－", "＋"]
        for i in 0..<4 {
            let buttonOperator = UIButton(type: .custom)
            buttonOperator.frame = CGRect(x: btnSideLength * 3, y: resultLabelRectHeight + btnSideLength * i, width: btnSideLength, height: btnSideLength)
            buttonOperator.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize + 10))
            buttonOperator.setTitle(operatorArray[i], for: UIControlState.normal)
            buttonOperator.setTitleColor(UIColor.white, for: UIControlState.normal)
            buttonOperator.setBackgroundImage(UIImage(named: "keypad_button_colored_background"), for: UIControlState.normal)
            buttonOperator.layer.masksToBounds = true
            buttonOperator.layer.borderWidth = 0.5
            buttonOperator.layer.borderColor = UIColor.darkGray.cgColor
            buttonOperator.addTarget(self, action: #selector(onClick(sender:)), for: UIControlEvents.touchUpInside)
            self.view.addSubview(buttonOperator)
        }
        
        let buttonEqualTo = UIButton(type: .custom)
        buttonEqualTo.frame = CGRect(x: btnSideLength * 3, y: resultLabelRectHeight + btnSideLength * 4, width: btnSideLength, height: btnSideLength)
        buttonEqualTo.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize + 10))
        buttonEqualTo.setTitle("=", for: UIControlState.normal)
        buttonEqualTo.setBackgroundImage(UIImage(named: "keypad_button_colored_background"), for: UIControlState.normal)
        buttonEqualTo.setTitleColor(UIColor.white, for: UIControlState.normal)
        buttonEqualTo.layer.masksToBounds = true
        buttonEqualTo.layer.borderWidth = 0.5
        buttonEqualTo.layer.borderColor = UIColor.darkGray.cgColor
        buttonEqualTo.addTarget(self, action: #selector(onClick(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(buttonEqualTo)
        
        let buttonAC = UIButton(type: .custom)
        buttonAC.frame = CGRect(x: 0, y: resultLabelRectHeight, width: btnSideLength, height: btnSideLength)
        buttonAC.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        buttonAC.setTitle("AC", for: UIControlState.normal)
        buttonAC.setBackgroundImage(UIImage(named: "keypad_button_colored_background"), for: UIControlState.normal)
        buttonAC.setTitleColor(UIColor.white, for: UIControlState.normal)
        buttonAC.layer.masksToBounds = true
        buttonAC.layer.borderWidth = 0.5
        buttonAC.layer.borderColor = UIColor.darkGray.cgColor
        buttonAC.addTarget(self, action: #selector(onClick(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(buttonAC)
        
        let buttonPrecent = UIButton(type: .custom)
        buttonPrecent.frame = CGRect(x: btnSideLength * 2, y: resultLabelRectHeight, width: btnSideLength, height: btnSideLength)
        buttonPrecent.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        buttonPrecent.setTitle("％", for: UIControlState.normal)
        buttonPrecent.setBackgroundImage(UIImage(named: "keypad_button_colored_background"), for: UIControlState.normal)
        buttonPrecent.setTitleColor(UIColor.white, for: UIControlState.normal)
        buttonPrecent.layer.masksToBounds = true
        buttonPrecent.layer.borderWidth = 0.5
        buttonPrecent.layer.borderColor = UIColor.darkGray.cgColor
        buttonPrecent.addTarget(self, action: #selector(onClick(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(buttonPrecent)
        
        let buttonSign = UIButton(type: .custom)
        buttonSign.frame = CGRect(x: btnSideLength, y: resultLabelRectHeight, width: btnSideLength, height: btnSideLength)
        buttonSign.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontSize + 15))
        buttonSign.setTitle("±", for: UIControlState.normal)
        buttonSign.setBackgroundImage(UIImage(named: "keypad_button_colored_background"), for: UIControlState.normal)
        buttonSign.setTitleColor(UIColor.white, for: UIControlState.normal)
        buttonSign.layer.masksToBounds = true
        buttonSign.layer.borderWidth = 0.5
        buttonSign.layer.borderColor = UIColor.darkGray.cgColor
        buttonSign.addTarget(self, action: #selector(onClick(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(buttonSign)
        
        
        
    }
      override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func onClick(sender : UIButton) {
        print("Click  " + sender.title(for: UIControlState.normal)!)
        let sender = sender.title(for: UIControlState.normal)!
        
        
        switch sender {
        case "AC":
            inPutString = ""
            labelOperators.text! = ""
            labelResultBottom.text! = "0"
            labelResultTop.text! = ""
            Operator = ""
            operand1 = 0
            operand2 = 0
            
            break
            
        case "÷", "×", "－", "＋":
            if Operator == "" {
                Operator = sender
                labelOperators.text = Operator
                print(inPutString)
                print(operand1)
                print(operand2)
                labelResultTop.text = labelResultBottom.text
                labelResultBottom.text = "0"
                inPutString = ""
                operand2 = operand1
                operand1 = 0
                print(inPutString)
                print(operand1)
                print(operand2)
                break
                
            } else {
                
                var result: Double = 0
                switch Operator {
                case "＋":
                    result = operand2 + operand1
                    operand2 = result
                    operand1 = 0
                    inPutString = ""
                    labelResultTop.text = String(result)
                    if labelResultTop.text!.hasSuffix(".0") {
                        labelResultTop.text!.removeLast()
                        labelResultTop.text!.removeLast()
                    }
                    labelResultBottom.text = "0"
                    Operator = sender
                    labelOperators.text = Operator
                    
                    break
                case "－":
                    result = operand2 - operand1
                    operand2 = result
                    operand1 = 0
                    inPutString = ""
                    labelResultTop.text = String(result)
                    if labelResultTop.text!.hasSuffix(".0") {
                        labelResultTop.text!.removeLast()
                        labelResultTop.text!.removeLast()
                    }
                    labelResultBottom.text = "0"
                    Operator = sender
                    labelOperators.text = Operator
                    
                    break
                case "×":
                    result = operand2 * operand1
                    operand2 = result
                    operand1 = 0
                    inPutString = ""
                    labelResultTop.text = String(result)
                    if labelResultTop.text!.hasSuffix(".0") {
                        labelResultTop.text!.removeLast()
                        labelResultTop.text!.removeLast()
                    }
                    labelResultBottom.text = "0"
                    Operator = sender
                    labelOperators.text = Operator
                    
                    break
                case "÷":
                    if operand1 == 0 {
                        return
                    }
                    result = operand2 / operand1
                    operand2 = result
                    operand1 = 0
                    inPutString = ""
                    labelResultTop.text = String(result)
                    if labelResultTop.text!.hasSuffix(".0") {
                        labelResultTop.text!.removeLast()
                        labelResultTop.text!.removeLast()
                    }
                    labelResultBottom.text = "0"
                    Operator = sender
                    labelOperators.text = Operator
                    
                    break
                default:
                    break
                }
            }
            
        case "=":
            var tmp: Double = 0
            
            switch Operator {
            case "＋":
                tmp = operand2 + operand1
                print(operand1)
                print(operand2)
                operand2 = 0
                operand1 = tmp
                inPutString = ""
                labelResultBottom.text = String(tmp)
                if labelResultBottom.text!.hasSuffix(".0") {
                    labelResultBottom.text!.removeLast()
                    labelResultBottom.text!.removeLast()
                }
                labelResultTop.text = ""
                print(operand1)
                print(operand2)
                
                break
            case "－":
                tmp = operand2 - operand1
                operand2 = 0
                operand1 = tmp
                inPutString = ""
                labelResultBottom.text = String(tmp)
                if labelResultBottom.text!.hasSuffix(".0") {
                    labelResultBottom.text!.removeLast()
                    labelResultBottom.text!.removeLast()
                }
                labelResultTop.text = ""
                
                break
            case "×":
                tmp = operand2 * operand1
                operand2 = 0
                operand1 = tmp
                inPutString = ""
                labelResultBottom.text = String(tmp)
                if labelResultBottom.text!.hasSuffix(".0") {
                    labelResultBottom.text!.removeLast()
                    labelResultBottom.text!.removeLast()
                }
                labelResultTop.text = ""
               
                break
            case "÷":
                if operand1 == 0 {
                    return
                }
                tmp = operand2 / operand1
                operand2 = 0
                operand1 = tmp
                inPutString = ""
                labelResultBottom.text = String(tmp)
                if labelResultBottom.text!.hasSuffix(".0") {
                    labelResultBottom.text!.removeLast()
                    labelResultBottom.text!.removeLast()
                }
                labelResultTop.text = ""
                break
            default:
                break
            }
            labelOperators.text = "="
            Operator = ""
            print(inPutString)
            print(operand1)
            print(operand2)
            
            break
            
        case "％":
            switch labelResultBottom.text! {
                
            case "0", "-0","0.", "-0.":
                    return
            default:
                if abs(operand1) > 0.1 {
                    inPutString = String(Double(labelResultBottom.text!)! / 100)
                    labelResultBottom.text = inPutString
                    operand1 = Double(inPutString)!
                    print("ope>0")
                    print(operand1)
                } else {
                    inPutString = labelResultBottom.text!
                    inPutString.insert("0", at: .init(encodedOffset: 2))
                    inPutString.insert("0", at: .init(encodedOffset: 2))
                    labelResultBottom.text = inPutString
                    operand1 = Double(inPutString) ?? 0
                    print(operand1)
                    print("ope<0")
                }
                break
            }
            break
       
        case "±":
            switch labelResultBottom.text!.hasPrefix("-") {
                
            case true:
                if labelResultBottom.text == "-0" {
                    labelResultBottom.text?.removeFirst()
                    inPutString = ""
                    operand1 = 0
                    print(inPutString)
                    print(operand1)
                    print(operand2)
                } else {
                    labelResultBottom.text?.removeFirst()
                    inPutString = labelResultBottom.text!
                    operand1 = Double(inPutString)!
                    print(inPutString)
                    print(operand1)
                    print(operand2)
                }
                
            case false:
                if labelResultBottom.text == "0" {
                    labelResultBottom.text!.insert("-", at: .init(encodedOffset: 0))
                    inPutString = "-"
                    operand1 = -0.0
                    print(inPutString)
                    print(operand1)
                    print(operand2)

                } else {
                    labelResultBottom.text!.insert("-", at: .init(encodedOffset: 0))
                    inPutString = labelResultBottom.text!
                    operand1 = Double(inPutString)!
                    print(inPutString)
                    print(operand1)
                    print(operand2)
                }
            }
            
            
            break
            
        case ".":
            if labelResultBottom.text!.contains(".") {
                return
            }
            
            switch labelResultBottom.text! {
            case "0":
                inPutString = "0."
                labelResultBottom.text = inPutString
                operand1 = 0
                print(operand1)
            case "-0":
                inPutString = "-0."
                labelResultBottom.text = inPutString
                operand1 = -0
                print(operand1)
            default:
                inPutString.append(sender)
                labelResultBottom.text = inPutString
                operand1 = Double(inPutString)!
                print(operand1)
            }
            
            break
            
        case "0":
            switch labelResultBottom.text! {
            case "0":
                return
            default:
                inPutString.append(sender)
                labelResultBottom.text = inPutString
                operand1 = Double(inPutString)!
                print(operand1)
            }
            break
            
        default:
            
            let inPutStrCount = labelResultBottom.text!.characters.count
            if inPutStrCount >= 9  {
                return
            }
            
            if labelOperators.text == "=" {
                labelOperators.text = ""
            }
            
            inPutString.append(sender)
            labelResultBottom.text = inPutString
            operand1 = Double(inPutString)!
            print("re \(operand1)")
            print("re \(inPutString)")
            print("re op2 \(operand2)")
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    //MARK: second
//
//    case "÷", "×", "－", "＋":
//    Operator = sender
//    if labelResultTop.text! == "" {
//    labelResultTop.text = labelResultBottom.text
//    labelOperators.text = Operator
//    operand1 = Double(labelResultTop.text!)!
//    labelResultBottom.text = "0"
//    inPutString = ""
//    print(operand1)
//    print(operand2)
//    }
//    print(operand1)
//    print(operand2)
//
//
//    case "=":
//
//    //            var result: Double = 0
//    //            inPutString = labelResultBottom.text!
//    //            operand1 = Double(inPutString)!
//    //            operand2 = Double(labelResultTop.text!) ?? 0
//    //            switch Operator {
//    //            case "＋":
//    //                result = operand1 + operand2
//    //                labelResultBottom?.text = "\(result)"
//    //            case "－":
//    //                result = operand1 - operand2
//    //                labelResultBottom?.text = "\(result)"
//    //            case "×":
//    //                result = operand1 * operand2
//    //                labelResultBottom?.text = "\(result)"
//    //            case "÷":
//    //
//    //                result = operand1 / operand2
//    //                labelResultBottom?.text = "\(result)"
//    //            default:
//    //                return
//    //            }
//    //            labelResultBottom?.text = "\(result)"
//    //            labelOperators.text = "="
//    //            labelResultTop.text = ""
//    //            Operator = "="
//    //            operand1 = result
//    //            operand2 = 0
//    //            print(operand1)
//    //            print(operand2)
//    //
//
//    if labelResultBottom.text!.hasSuffix(".0") {
//    labelResultBottom.text?.removeLast()
//    labelResultBottom.text?.removeLast()
//    }
//
//
//    //            labelOperators.text = "="
//    //            labelResultTop.text = ""
//    //            labelResultBottom.text = inPutString
//
//
    
    //MARK: fist
    
    //
//    @objc func onClick(sender : UIButton) {
//        print("Click  " + sender.title(for: UIControlState.normal)!)
//        let sender = sender.title(for: UIControlState.normal)!
//        switch sender{
//
//        case "÷", "×", "－", "＋":
//            isMinus = false
//            Operator = sender
//            labelOperators.text = Operator
//            labelResultTop.text = String(operand1)
//            labelResultBottom.text = String(operand2)
//            inPutString = ""
//
//            print(operand1)
//            print(operand2)
//            break
//
//        case "％":
//            isMinus = false
//            operand1 = operand1 / 100
//            labelResultBottom.text = String(operand1)
//            print(operand1)
//            print(operand2)
//
//            break
//
//        case "±":
//            if labelResultBottom.text == "0" {
//                return
//            }
//            inPutString = labelResultBottom.text!
//            let overTurnNum = abs(Double(labelResultBottom.text!)! * 2)
//            print(overTurnNum)
//            if labelResultBottom.text!.contains("-") {
//                 isMinus = true
//            }
//            switch isMinus {
//            case true:
//                operand1 = Double(inPutString) ?? 0
//                operand1 += overTurnNum
//                isMinus = !isMinus
//                labelResultBottom.text = String(operand1)
//
//            case false:
//                operand1 = Double(inPutString) ?? 0
//                print(operand1)
//                print(operand2)
//                operand1 -= overTurnNum
//                isMinus = !isMinus
//                labelResultBottom.text = String(operand1)
//            }
//            print(operand1)
//            print(operand2)
//            break
//
//        case "=":
//            isMinus = false
//            var result: Double = 0
//            inPutString = labelResultBottom.text!
//            operand1 = Double(inPutString)!
//            operand2 = Double(labelResultTop.text!) ?? 0
//            switch Operator {
//                case "＋":
//                result = operand1 + operand2
//                labelResultBottom?.text = "\(result)"
//                case "－":
//                result = operand1 - operand2
//                labelResultBottom?.text = "\(result)"
//                case "×":
//                result = operand1 * operand2
//                labelResultBottom?.text = "\(result)"
//                case "÷":
//                result = operand1 / operand2
//                labelResultBottom?.text = "\(result)"
//                default:
//                return
//            }
//            labelResultBottom?.text = "\(result)"
//            labelOperators.text = "="
//            labelResultTop.text = ""
//            Operator = "="
//            operand1 = result
//            operand2 = 0
//            print(operand1)
//            print(operand2)
//            break
//
//        case "AC":
//            operand1 = 0
//            operand2 = 0
//            Operator = ""
//            inPutString = ""
//            labelResultBottom.text = "0"
//            labelResultTop.text = ""
//            labelOperators.text = Operator
//            isMinus = false
//            break
//        case ".":
//            isMinus = false
//            if (labelResultBottom.text?.contains("."))! {
//                print(operand1)
//                print(operand2)
//                print(inPutString)
//                break
//            } else if labelResultBottom.text == "0" {
//                inPutString = "0"
//                inPutString.append(sender)
//                labelResultBottom.text = inPutString
//                print(operand1)
//                print(operand2)
//                print(inPutString)
//                break
//            }
//            inPutString.append(sender)
//            labelResultBottom.text = inPutString
////            print(operand1)
//            operand1 = Double(inPutString)!
//            print(operand1)
//            print(operand2)
//            print(inPutString)
//            break
//
//        default:
//
//            if Operator == "" && labelResultTop.text == "" {
//                if Operator == "" && labelResultTop.text == "" && labelResultBottom.text == "0" {
//                    labelResultBottom.text = ""
//                }
//                labelResultBottom.text!.append(sender)
//                inPutString = labelResultBottom.text!
//                operand1 = Double(inPutString)!
//                print(operand1)
//                print(operand2)
//
//            } else if Operator == "=" {
//                operand1 = Double(sender)!
//                operand2 = 0
//                Operator = ""
//                labelResultBottom.text = sender
//                labelResultTop.text = ""
//                labelOperators.text = ""
//                print(operand1)
//                print(operand2)
//
//            } else {
////                let tmp = Double(sender)!
////                operand2 = operand2 * 10 + tmp
////                labelResultBottom?.text = "\(operand2)"
//                inPutString.append(sender)
//                labelResultBottom.text = inPutString
//                operand2 = Double(inPutString)!
//
//                print(operand1)
//                print(operand2)
//            }
//            break
//        }
//
//        if (labelResultBottom.text?.hasSuffix(".0"))! {
//            labelResultBottom.text?.removeLast()
//            labelResultBottom.text?.removeLast()
//        }
//
//        if (labelResultTop.text?.hasSuffix(".0"))! {
//            labelResultTop.text?.removeLast()
//            labelResultTop.text?.removeLast()
//        }
//
//
//    }
//
   
    
}

