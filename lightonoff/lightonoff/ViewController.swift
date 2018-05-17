//
//  ViewController.swift
//  lightonoff
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
    var count : Int = 0
    @IBOutlet weak var touchCount: UILabel!
    @IBAction func lightonoff(_ sender: UIButton)
    {
        if sender.tag == 0 {
            sender.setImage(
                UIImage(named:"lighton"),
                for: .normal
            )
            sender.tag = 1
        }
        else {
            sender.setImage (
                UIImage(named:"lightoff"),
                for: .normal
            )
            sender.tag = 0
            count += 1
            touchCount.text = "\(count) clicks"
    }
    

}

}
