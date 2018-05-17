//
//  ViewController.swift
//  the memory game
//
//  Created by 王子璇 on 2018/3/21.
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
    var img : [UIImage] = [
        UIImage(named: "X")!,
        UIImage(named: "add")!,
        UIImage(named: "blue")!,
        UIImage(named: "close")!,
        UIImage(named: "go")!,
        UIImage(named: "images")!,
        UIImage(named: "open")!,
        UIImage(named: "orange")!,
        UIImage(named: "reset")!,
    ]
    func rotate(_ sender : UIButton){
        UIView.animate(withDuration: 0.75, animations:{
            sender.layer.transform =
                CATransform3DMakeRotation(22.0/7, 0, 1, 0)
    })
    }
    var lastButton : UIButton?
    
    @IBOutlet weak var counting: UILabel!
    @IBAction func buttonTouched(_ sender: UIButton) {
        if sender.tag == -1{ return }
        sender.setImage(img[sender.tag], for: .normal)
        rotate(sender)
        if lastButton == nil{
            lastButton = sender
        }
        else if lastButton != nil &&
            sender.tag == lastButton!.tag {
            counting.text = "\(Int (counting.text!)! + 1)"
            sender.tag = -1
            lastButton!.tag = -1
            lastButton = nil
        }
        else {
            sender.setImage(img[0], for: .normal)
            lastButton!.setImage(img[0], for: .normal)
            rotate (sender)
            rotate (lastButton!)
            lastButton = nil
        }
    }
    @IBOutlet var buttons: [UIButton]!
    var score : Int = 0
    @IBAction func reset(_ sender: UIButton) {
        counting.text = "0"
        
        var nums = Array(0..<buttons.count)
        while nums.count > 0 {
            var i = Int(arc4random_uniform(UInt32(nums.count)))
            var j = Int(arc4random_uniform(UInt32(nums.count)))
            
            if i != j {
                if i > j {
                    i = nums.remove(at: i)
                    j = nums.remove(at: j)
                }
                else{
                    j = nums.remove(at: j)
                    i = nums.remove(at: i)
                }
                let random = Int(arc4random_uniform(UInt32(img.count - 1)) + 1)
                buttons[i].tag = random
                buttons[j].tag = random
                
                buttons[i].setImage(img[0], for: .normal)
                buttons[j].setImage(img[0], for: .normal)
            }

    }
       
}
}
