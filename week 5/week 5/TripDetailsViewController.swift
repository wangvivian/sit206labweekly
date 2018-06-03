//
//  TripDetailsViewController.swift
//  week 5
//
//  Created by 王子璇 on 2018/6/3.
//  Copyright © 2018年 王子璇. All rights reserved.
//

import UIKit

class TripDetailsViewController: UITableViewController {
    var trip : Trip?
    
    @IBOutlet weak var tripDestination: UITextField!
    @IBOutlet weak var tripDuration: UITextField!
    @IBOutlet weak var tripDate: UITextField!
    
    @IBAction func saveTrip(_ sender: UIButton) {
        trip?.tripDestination = tripDestination.text!
        trip?.tripDuration = Int(tripDuration.text!)!
        trip?.tripDate = tripDate.text!
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        tripDestination.text = trip?.tripDestination
        tripDuration.text = "\(trip?.tripDuration)"
        tripDate.text = trip?.tripDate
    }
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


