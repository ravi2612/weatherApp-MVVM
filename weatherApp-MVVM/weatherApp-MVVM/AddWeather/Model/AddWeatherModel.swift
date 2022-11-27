//
//  AddWeatherModel.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 13/11/22.
//

import UIKit

struct ConstantsAddWeatherView {
    static let title = "Add City"
    
    struct Image {
        static var IconWeathersLauchScreen = UIImage(named: "Icon-WeathersLauchScreen")!
    }
    
    struct Colors {
        static let HomeHeader = UIColor(named: "Home-Header")!
    }
}

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

