//
//  CurrentWeather.swift
//  Weather app
//
//  Created by Filip  Gonera on 04/09/2018.
//  Copyright © 2018 Filip  Gonera. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CurrentWeather {
    
    private var _location: String!
    private var _day: String!
    private var _weatherDescription: String!
    private var _currentTemp: String!
    private var _iconName: String!
    
    
    let viewController = CurrentWeatherViewController()
    
    var location: String {
        if _location == nil {
            _location = ""
        }
        return _location
    }
    
    var day: String {
        if _day == nil {
            _day = ""
        }
        return _day
    }
    
    var weatherDescription: String {
        if _weatherDescription == nil {
            _weatherDescription = ""
        }
        return _weatherDescription
    }
    
    var currentTemp: String {
        if _currentTemp == nil {
            _currentTemp = ""
        }
        return _currentTemp
    }
    
    var iconName: String {
        if _iconName == nil {
            _iconName = ""
        }
        return _iconName
    }
    
    func downloadCurrentWeather (completed: @escaping DownloadComplete) {
        Alamofire.request(CURRENT_API_URL).responseJSON { (response) in
            print(CURRENT_API_URL)
            
            let response = response.result
            let jsonResponse = JSON(response.value!)
            
            //Here i access and assign values from JSON response to variables
            
                let jsonWeather = jsonResponse["weather"].array![0]
                let jsonTemp = jsonResponse["main"]
                let jsonIcon = jsonWeather["icon"].stringValue
                
                self._location = jsonResponse["name"].stringValue
                print(self.location)
                self._iconName = jsonIcon
                print(self.iconName)
                self._weatherDescription = jsonWeather["main"].stringValue
                print(self.weatherDescription)
                self._currentTemp = "\(Int(round(jsonTemp["temp"].doubleValue)))"
                print(self.currentTemp)
                
                let date = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "EEEE"
                
                self._day = dateFormatter.string(from: date)
                print(self.day)
            
            print (response)
            completed()
        }
       
    }
    
    
}
