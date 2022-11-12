//
//  HomeWeatherViewModel.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 07/11/22.
//

import Foundation

protocol HomeWeatherViewModelDelegate {
    func loading(_ show: Bool)
    func weatherloaded(_ loaded: Bool)
}

final class HomeWeatherViewModel {
    
    public var delegate: HomeWeatherViewModelDelegate?
    var weatherList: [HomeWeatherModel]? = [HomeWeatherModel(city: "Fortaleza", temp: "32°C"), HomeWeatherModel(city: "São Paulo", temp: "17°C")]
    
    public init(delegate: HomeWeatherViewModelDelegate?) {
        self.delegate = delegate
        self.delegate?.weatherloaded(true)
    }
}
