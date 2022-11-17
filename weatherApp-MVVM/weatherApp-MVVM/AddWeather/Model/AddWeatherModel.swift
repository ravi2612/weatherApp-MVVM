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

struct WeatherIcons{
    
        static let HeavyRain = UIImage(named: "chuva forte")!//11d
        static let Rain = UIImage(named: "chuva")!//10d
        static let Overcast = UIImage(named: "encoberto")!
        static let Frost = UIImage(named: "geada")!
        static let Snow = UIImage(named: "neve")!//13d
        static let Fog = UIImage(named: "nevoeiro")!//50d
        static let Cloudy = UIImage(named: "nublado")!//02d,02n,03d,03n,04d,04n
        static let Sun = UIImage(named: "Sol")!//01d,01n
}
