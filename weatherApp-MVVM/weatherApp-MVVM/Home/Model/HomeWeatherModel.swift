//
//  HomeWeatherModel.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 07/11/22.
//

import Foundation

struct HomeWeatherModel {
    var city: String?
    var temp: String?
    
    init(city: String? = nil, temp: String? = nil) {
        self.city = city
        self.temp = temp
    }
}
