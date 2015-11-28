//
//  ViewController.swift
//  mapKitDemo
//
//  Created by ROHIT GUPTA on 11/27/15.
//  Copyright © 2015 ROHIT GUPTA. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet weak var map: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lattiude : CLLocationDegrees = 33.8090
        let longitude : CLLocationDegrees = -117.9190
        
        let location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(lattiude, longitude)
        
        let latitudeDelta : CLLocationDegrees = 0.04
        let longitudeDelta : CLLocationDegrees = 0.04
        let span : MKCoordinateSpan = MKCoordinateSpanMake(latitudeDelta, longitudeDelta)
        
        let region : MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: true)
        
        // add map location and pin
        
        let disneyland = MKPointAnnotation()
        disneyland.coordinate = location
        disneyland.title = "Disneyland-The Happiest Place in the World!"
        map.addAnnotation(disneyland)
        
        // add gesture recognizer
        
        let longPress = UILongPressGestureRecognizer(target: self, action: "mapLongPress:")
        longPress.minimumPressDuration = 1.5
        map.addGestureRecognizer(longPress)


    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func mapLongPress(recognizer: UIGestureRecognizer) {
        
        print("A long press has been detected!")
        
        let touchedAt = recognizer.locationInView(self.map)
        let touchedAtCoordinate : CLLocationCoordinate2D = map.convertPoint(touchedAt, toCoordinateFromView: self.map)
        
        let newPin = MKPointAnnotation()
        newPin.coordinate = touchedAtCoordinate
        map.addAnnotation(newPin)
        
    }


}

