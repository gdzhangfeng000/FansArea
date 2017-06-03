//
//  ViewController.swift
//  First HelloWorld
//
//  Created by Zhang Feng on 2017/5/20.
//  Copyright © 2017年 Zhang Feng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func touch(_ sender: UIButton) {
        
        let ac = UIAlertController(title: "老婆", message: "刘梦娜", preferredStyle: .alert)
        
        let btn = UIAlertAction(title: "好", style:.default , handler: nil)
        ac.addAction(btn)
        
        self.present(ac, animated: true, completion: nil)
        
        
        print("NaNa!")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

