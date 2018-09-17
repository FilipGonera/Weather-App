//
//  Extensions.swift
//  Weather app
//
//  Created by Filip  Gonera on 06/09/2018.
//  Copyright © 2018 Filip  Gonera. All rights reserved.
//

import Foundation

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
    
    func hourOfTheDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
}
