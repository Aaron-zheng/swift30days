//
//  ViewController.swift
//  day6-location
//
//  Created by Aaron on 11/4/16.
//  Copyright (c) 2016 sightcorner. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var locationLabel: UILabel!
    
    var locationManager: CLLocationManager!

    @IBAction func buttonDidTouch(sender: UIButton) {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        self.locationLabel.text = "Error while updating location " + error.localizedDescription
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler:{(placemarks, error)->Void
            in

            if error != nil {
                self.locationLabel.text = "reverse geocoder failed with error " + error.description
                return
            }
            
            if placemarks.count > 0 {
                let pm = placemarks[0] as CLPlacemark
                self.displayLocationInfo(pm)
            } else {
                self.locationLabel.text = "Problem with the data received from geocoder."
            }
        })
        locationManager.stopUpdatingLocation()
    }
    
    func displayLocationInfo(placemark: CLPlacemark?) {
        if let pm = placemark {
            let locality = pm.locality != nil ? pm.locality : ""
            let postalCode = pm.postalCode != nil ? pm.postalCode : ""
            let administrativeArea = pm.administrativeArea != nil ? pm.administrativeArea : ""
            let country = pm.country != nil ? pm.country : ""
            
            self.locationLabel.text = locality + " " + postalCode + " " + administrativeArea + " " + country
        }
    }
    
    
    
    
    
    
}

