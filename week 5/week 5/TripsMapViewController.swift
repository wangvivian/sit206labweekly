//
//  TripsMapViewController.swift
//  week 5
//
//  Created by 王子璇 on 2018/6/3.
//  Copyright © 2018年 王子璇. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class TripsMapViewController: UIViewController, MKMapViewDelegate,
    CLLocationManagerDelegate{

    @IBOutlet weak var tripsMap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tripsMap.delegate = self
        tripsMap.showsUserLocation = true
        if Trips.trips.count <= 0 {
            Trips.loadTrips()
        }
        for trip in Trips.trips{
            tripsMap.addAnnotation(trip)
        }

        // Do any additional setup after loading the view.
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationId = "viewForAnnoation"
        var annoationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationId)
        if((annotation as? Trips) != nil){
            if annoationView == nil{
                annoationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationId)
                annoationView?.image = (annotation as! Trip).img
                annoationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                annoationView?.canShowCallout = true
        }
    }
        return annoationView
    }
    func mapView(_ mapView: MKMapView, annotationView view : MKAnnotationView,calloutAccessoryControlTapped control:UIControl) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tripDetails")
        (vc as! TripDetailsViewController).trip = view.annotation as? Trip
        self.present(vc!, animated: true,completion: nil )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
