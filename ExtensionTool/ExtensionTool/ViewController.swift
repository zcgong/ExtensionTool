//
//  ViewController.swift
//  ExtensionTool
//
//  Created by 张崇超 on 2018/7/9.
//  Copyright © 2018年 ZCC. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    deinit {
        print("###\(self)销毁了###\n")
    }
}

class ViewController: BaseViewController {
    
    let secondVC = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.k_colorWith(hexInt: 0x666666)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
   
}

class SecondViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.k_colorWith(hexInt: 0x999999)

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
