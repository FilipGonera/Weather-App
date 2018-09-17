//
//  ForecastViewController.swift
//  Weather app
//
//  Created by Filip  Gonera on 09/09/2018.
//  Copyright © 2018 Filip  Gonera. All rights reserved.
//

import UIKit
import Alamofire

class ForecastWeatherViewController: UIViewController {
    
    @IBOutlet weak var forecastTableView: UITableView!
    @IBOutlet weak var forecastTitleNavBar: UINavigationBar!
    
    var forecastWeather: ForecastWeather!
    var forecastArray = [ForecastWeather]()

    override func viewDidLoad() {
        super.viewDidLoad()

        callDelegates()
        downloadForecastWeather {
            print("data downloaded")
        }
        forecastTitleNavBar.topItem?.title = "5 day forecast"
        
        // Do any additional setup after loading the view.
    }

    func callDelegates(){
        forecastTableView.delegate = self
        forecastTableView.dataSource = self
    }
    
    func downloadForecastWeather(completed: @escaping DownloadComplete){ 
        print(FORECAST_API_URL)
        Alamofire.request(FORECAST_API_URL).responseJSON { (response) in
            let result = response.result
            if let dictionary = result.value as? Dictionary<String, AnyObject>{
                if let list = dictionary["list"] as? [Dictionary<String, AnyObject>] {
                    for i in list {
                        let forecast = ForecastWeather(weatherDict: i)
                        self.forecastArray.append(forecast)
                    }
                    self.forecastTableView.reloadData()
                }
            }
            completed()    //I inform that downloading is completed
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension ForecastWeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ForecastCell
        
        cell.configureCell(forecastData: forecastArray[indexPath.row])
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastArray.count
    }
    
}
