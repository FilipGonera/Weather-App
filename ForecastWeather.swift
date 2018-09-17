//
//  ForecastWeather.swift
//  Weather app
//
//  Created by Filip  Gonera on 05/09/2018.
//  Copyright © 2018 Filip  Gonera. All rights reserved.
//

import Foundation

class ForecastWeather {
    
    private var _forecastDay: String!
    private var _forecastTemp: String!
    private var _forecastHour: String!
    private var _forecastIconName: String!
    
    var forecastDay: String {
        if _forecastDay == nil{
            _forecastDay = ""
        }
        return _forecastDay
    }
    
    var forecastTemp: String {
        if _forecastTemp == nil {
            _forecastTemp = ""
        }
        return _forecastTemp
    }
    
    var forecastHour: String {
        if _forecastHour == nil {
            _forecastHour = ""
        }
        return _forecastHour
    }
    
    var forecastIconName: String {
        if _forecastIconName == nil {
            _forecastIconName = ""
        }
        return _forecastIconName
    }
    
    
    init(weatherDict: Dictionary<String, AnyObject>){
        if let temp = weatherDict["main"] as? Dictionary<String, AnyObject> { //Accessing tempreture from JSON response
            if let dayTemp = temp["temp"] as? Double {
                self._forecastTemp = "\(Int(round(dayTemp)))" 
                print("Forecast temp = \(forecastTemp)")
            }
         }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] { //Accessing iconName from JSON response
            if let iconName = weather[0]["icon"] as? String {
                self._forecastIconName = iconName
                print(iconName)
                print(forecastIconName)
            }
        }
        
        if let date = weatherDict["dt"] as? Double { //Here I am accessing date from the JSON in 'seconds from 1970'
            
            
            let rawDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            
            self._forecastDay = "\(rawDate.dayOfTheWeek())" // Using extension to convert date to name of the day
            
            self._forecastHour = "\(rawDate.hourOfTheDay())" // Using extension to convert time of the forecast to format "HH:mm"
            //print(forecastHour) //to check result
            //print(date) //to check result
        }
        
        
    }
    
    
}
