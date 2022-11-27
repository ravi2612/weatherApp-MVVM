//
//  ConstantsHome.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 27/11/22.
//

import UIKit

struct ConstantsHome {
    static let HeaderColor: UIColor = UIColor(named: "Home-Header")!
    static let TitleLabel = "Weather App"
    static let BtnPlus = "plus.app"
    
    struct Notification {
        static let ReloadTableViewHomeWeather = NSNotification.Name(rawValue: "ReloadTableViewHomeWeather")
    }
    
    struct WeatherImages {
        static let HeavyRain = UIImage(named: "Icon-HeavyRainLaunchScreen")!//11d
        static let Rain = UIImage(named: "Icon-RainLaunchScreen")!//10d
        static let Overcast = UIImage(named: "encoberto")!
        static let Frost = UIImage(named: "geada")!
        static let Snow = UIImage(named: "neve")!//13d
        static let Fog = UIImage(named: "nevoeiro")!//50d
        static let Cloudy = UIImage(named: "nublado")!//02d,02n,03d,03n,04d,04n
        static let Sun = UIImage(named: "Icon-SunLaunchScreen")!//01d,01n
    }
}
