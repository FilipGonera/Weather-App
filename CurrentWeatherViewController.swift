//
//  ViewController.swift
//  Weather app
//
//  Created by Filip  Gonera on 31/08/2018.
//  Copyright © 2018 Filip  Gonera. All rights reserved.
//
import Foundation
import UIKit
import CoreLocation
import Alamofire


class CurrentWeatherViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var tempretureLabel: UILabel!
    
    
    var lat = 64.128288
    var lon = -21.827774
    let locationManager = CLLocationManager()
    var currentWeather: CurrentWeather!
    var currentLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callDelegates()
        setupLocation()
        locationAuthCheck()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func callDelegates(){
        locationManager.delegate = self
    }
    
    func setupLocation(){
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    func locationAuthCheck(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            currentLocation = locationManager.location
            lat = currentLocation.coordinate.latitude
            lon = currentLocation.coordinate.longitude
            
            Location.sharedInstance.latitude = lat
            Location.sharedInstance.longitude = lon
            
            print(lat)
            print(lon)
            
            currentWeather = CurrentWeather()
            currentWeather.downloadCurrentWeather {
                self.updateUI() // Here I update the UI after completion of downloading data
            }
        } else {
           locationManager.requestWhenInUseAuthorization()
           locationAuthCheck()
        }
    }
    
    func updateUI() {
        
        print("updateUI called") // For debuging purpose I check if updateUI was successfuly called
        print(currentWeather.location)
        self.locationLabel.text = currentWeather.location
        print(currentWeather.location)
        self.iconImageView.image = UIImage(named: currentWeather.iconName)
        print(currentWeather.iconName)
        self.weatherDescriptionLabel.text = currentWeather.weatherDescription
        self.tempretureLabel.text = currentWeather.currentTemp
        self.dayLabel.text = currentWeather.day
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

