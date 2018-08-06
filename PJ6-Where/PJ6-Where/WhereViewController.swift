//
//  ViewController.swift
//  PJ6-Where
//
//  Created by Peter on 2018/8/5.
//  Copyright © 2018 Peter. All rights reserved.
//

import UIKit
import CoreLocation

class WhereViewController: UIViewController, CLLocationManagerDelegate{
    var locationManager: CLLocationManager?
    var label: UILabel?
    var button: UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        
        locationManager = CLLocationManager()
        label = UILabel(frame: CGRect(x: 7, y: 250, width: 400, height: 50))
        label?.backgroundColor = .gray
        self.view.addSubview(label!)
        
        button = UIButton.init(frame: CGRect(x: 157, y: 400, width: 100, height: 50))
        button?.backgroundColor = .yellow
        button?.addTarget(self, action: #selector(self.touchBtn), for: .touchDown)
        self.view.addSubview(button!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func touchBtn(){
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus != .authorizedWhenInUse && authorizationStatus != .authorizedAlways{
            locationManager?.requestWhenInUseAuthorization()
            return
        }
        if !CLLocationManager.locationServicesEnabled(){
            print("location service is not enabled")
            return
        }
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.distanceFilter = 100
        locationManager?.delegate = self
        locationManager?.startUpdatingLocation()
        
        button?.addTarget(self, action: #selector(self.touchBtnAgain), for: .touchDown)
    }
    
    @objc func touchBtnAgain(){
        self.label?.text = "stop updating location"
        locationManager?.stopUpdatingLocation()
        button?.addTarget(self, action: #selector(self.touchBtn), for: .touchDown)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemarks, error) in
            if error != nil{
                self.label?.text = error?.localizedDescription
            }
            if (placemarks?.count)! > 0 {
                let pm = placemarks![0]
                self.displayPlaceMark(placemark: pm)
            }else{
                self.label?.text = "Problem with the data received from geocoder"
            }
        }
    }
    
    func displayPlaceMark(placemark: CLPlacemark?){
        var country = placemark?.country != nil ? placemark?.country: ""
        var locality = placemark?.locality != nil ? placemark?.locality: ""
        self.label?.text = country! + " " + locality!
    }


}

