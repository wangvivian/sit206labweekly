//
//  ViewController.swift
//  week9
//
//  Created by 王子璇 on 2018/5/18.
//  Copyright © 2018年 王子璇. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gravity : UIGravityBehavior?
    var animator : UIDynamicAnimator?
    var gametimer : Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gametimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.addBallon(_ :)), userInfo: nil, repeats: true)
        animator = UIDynamicAnimator(referenceView: self.view)
        gravity = UIGravityBehavior(items: [])
        
        let vector = CGVector(dx: 0.0, dy: 0.1)
        gravity?.gravityDirection = vector
        animator?.addBehavior(gravity!)
    }
    
    
    @IBAction func didpopballoon(_ sender: UIButton) {
        sender.setImage(UIImage(named: "exploded"), for: .normal)
        UIView.animate(withDuration: 0.4, animations: {sender.alpha = 0}, completion: {(true) in sender.removeFromSuperview()})
        
    }
    @objc func addBallon(_ : Any){
        let xcoordinate = arc4random() % UInt32(self.view.bounds.width)
        let btn = UIButton(frame: CGRect(x: Int(xcoordinate), y: 60, width: 50, height: 50))
        btn.setImage(UIImage(named: "balloon"), for: .normal)
        btn.addTarget(self, action: #selector(self.didpopballoon(_:)), for: .touchUpInside)
        self.view.addSubview(btn)
        gravity?.addItem((btn as UIView))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

