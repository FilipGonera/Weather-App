//
//  ForecastCell.swift
//  Weather app
//
//  Created by Filip  Gonera on 05/09/2018.
//  Copyright © 2018 Filip  Gonera. All rights reserved.
//

import UIKit

class ForecastCell: UITableViewCell {

    
    @IBOutlet weak var forecastDayLabel: UILabel!
    @IBOutlet weak var forecastHourLabel: UILabel!
    @IBOutlet weak var forecastTempLabel: UILabel!
    @IBOutlet weak var forecastIconImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(forecastData: ForecastWeather) {
        self.forecastDayLabel.text = "\(forecastData.forecastDay)"
        self.forecastTempLabel.text = "\(forecastData.forecastTemp)°C" // Here i add celcius sign to tempreture value from JSON
        self.forecastHourLabel.text = "\(forecastData.forecastHour)"
        self.forecastIconImage.image = UIImage(named: forecastData.forecastIconName)
    }
    
}
