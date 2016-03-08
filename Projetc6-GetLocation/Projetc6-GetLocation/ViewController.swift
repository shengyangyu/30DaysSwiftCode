//
//  ViewController.swift
//  Projetc6-GetLocation
//
//  Created by shengyang_yu on 16/3/8.
//  Copyright © 2016年 yushengyang. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mButton: UIButton!
    @IBOutlet weak var mLabel: UILabel!
    
    var mLocationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.mButton.layer.cornerRadius = 5.0
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getLoactionAction(sender: UIButton) {
        
        mLocationManager = CLLocationManager()
        mLocationManager.delegate = self
        mLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        mLocationManager.requestAlwaysAuthorization()
        mLocationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
        self.mLabel.text = "Error while updating location " + error.localizedDescription
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemarks, error) -> Void in
            
            if (error != nil) {
                self.mLabel.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            if placemarks!.count > 0 {
                let pm = placemarks![0]
                self.displayLocationInfo(pm)
            } else {
                self.mLabel.text = "Problem with the data received from geocoder"
            }
        }
    }

    /*
    public var name: String? { get } // eg. Apple Inc.
    public var thoroughfare: String? { get } // street name, eg. Infinite Loop
    public var subThoroughfare: String? { get } // eg. 1
    public var locality: String? { get } // city, eg. Cupertino
    public var subLocality: String? { get } // neighborhood, common name, eg. Mission District
    public var administrativeArea: String? { get } // state, eg. CA
    public var subAdministrativeArea: String? { get } // county, eg. Santa Clara
    public var postalCode: String? { get } // zip code, eg. 95014
    public var ISOcountryCode: String? { get } // eg. US
    public var country: String? { get } // eg. United States
    public var inlandWater: String? { get } // eg. Lake Tahoe
    public var ocean: String? { get } // eg. Pacific Ocean
    public var areasOfInterest: [String]? { get } // eg. Golden Gate Park
    */
    
    func displayLocationInfo(placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            //stop updating location to save battery life
            mLocationManager.stopUpdatingLocation()
            /*
            print("\(containsPlacemark.name),\(containsPlacemark.thoroughfare),\(containsPlacemark.subThoroughfare),\(containsPlacemark.locality),\(containsPlacemark.subLocality),\(containsPlacemark.administrativeArea),\(containsPlacemark.subAdministrativeArea),\(containsPlacemark.postalCode),\(containsPlacemark.ISOcountryCode),\(containsPlacemark.country),\(containsPlacemark.inlandWater),\(containsPlacemark.ocean),\(containsPlacemark.areasOfInterest)");
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            */
            self.mLabel.text = containsPlacemark.name
        }
    }
}
