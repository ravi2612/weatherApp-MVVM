//
//  AddWeatherModel.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 13/11/22.
//

import UIKit

struct WeatherObjc: Decodable {
    var weather: [City]
    var main: Temp
    let name: String
}

struct Temp: Decodable {
    var temp: Double?
    var humidity: Int?
}

struct City: Decodable {
    var main: String? // "Clear"
    var description: String? // "Clear Sky"
    var icon: String? // "0ld"
}
