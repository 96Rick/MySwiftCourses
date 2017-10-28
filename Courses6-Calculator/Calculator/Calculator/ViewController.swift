//
//  ViewController.swift
//  Calculator
//
//  Created by Rick on 2017/10/28.
//  Copyright © 2017年 Rick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var inputNum = 0
//        var inputOperator = ""
//        var fontSize = 0
        let deviceHeight = UIScreen.main.bounds.height
        let deviceWidth = UIScreen.main.bounds.width
        let buttonLength = deviceWidth / 4
        
        
        
        
//
        var resultLabel = UILabel()
        resultLabel.frame = .init(x: 0, y: 0, width: 100, height: 100)
        resultLabel.text = "adf"
        resultLabel.backgroundColor = UIColor.black
        
        self.view.addSubview(resultLabel)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

