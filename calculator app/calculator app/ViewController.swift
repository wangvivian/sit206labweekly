//
//  ViewController.swift
//  calculator app
//
//  Created by 王子璇 on 2018/3/18.
//  Copyright © 2018年 王子璇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var x: UITextField!
    @IBOutlet weak var y: UITextField!
    
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var history: UILabel!
    
    
    @IBAction func cal(_ sender: UIButton) {
            var value : Double = 0;
        print(x.text!)
        print(y.text!)
            switch sender.tag {
            case 1 :
                value = Double(x.text!)! + Double(y.text!)!
                print(result)
            case 2 :
                value = Double(x.text!)! - Double(y.text!)!
            case 3 :
                value = Double(x.text!)! * Double(y.text!)!
            case 4 :
                value = Double(x.text!)! / Double(y.text!)!
            default:
                print("error")
            }
            result.text = "result:" + "\n \(value)"
            history.text = "\(history.text!) \n \(x.text!) + \(y.text!) = \(value)"
        }
        
    }
    


    


