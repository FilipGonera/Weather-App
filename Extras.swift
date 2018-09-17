//
//  Api's.swift
//  Weather app
//
//  Created by Filip  Gonera on 04/09/2018.
//  Copyright © 2018 Filip  Gonera. All rights reserved.
//

import Foundation

let ApiKey = "c19a3610c5cba0fbb3acf1366bfc1a14"
let CURRENT_API_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=\(ApiKey)&units=metric"

let FORECAST_API_URL = "http://api.openweathermap.org/data/2.5/forecast?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=\(ApiKey)&units=metric"

// This'll inform my function when it's done
typealias DownloadComplete = () -> ()

