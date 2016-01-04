//
//  Favorite.swift
//  TAFS IOS
//
//  Created by Moh Reza Luthfiansyah on 12/14/15.
//  Copyright © 2015 Ikonsultan Tafs. All rights reserved.
//

import Foundation
import UIKit
import Darwin
import MapKit
import CoreLocation

class Favorite : UIViewController,MKMapViewDelegate,CLLocationManagerDelegate
{
    
    
    @IBOutlet weak var MapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.locationManager.delegate = self
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
        self.MapView.showsUserLocation = true
    }
    
    //mark location method
    func locationManager(manager: CLLocationManager, didUpdateLocations locations : [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center,span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        self.MapView.setRegion(region, animated:true)
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(manager:CLLocationManager,didFailWithError error:NSError){
        print("Errors : " + error.localizedDescription)
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BtnExit(sender: UIButton) {
        exit(0)
    }
    
}