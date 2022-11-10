//
//  HomeWeatherViewModel.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 07/11/22.
//

import Foundation

protocol HomeWeatherViewModelCoordinatorDelegate {
    func loading(_ show: Bool)
    func weatherloaded(_ loaded: Bool)
}

final class HomeWeatherViewModel {
    
    public var delegate: HomeWeatherViewModelCoordinatorDelegate?
    var weatherList: [HomeWeatherModel]? = [HomeWeatherModel(city: "Fortaleza", temp: "32°C"), HomeWeatherModel(city: "São Paulo", temp: "17°C")]
    
    public init(delegate: HomeWeatherViewModelCoordinatorDelegate? = nil, weatherList: [HomeWeatherModel]? = nil) {
        self.delegate = delegate
        self.weatherList = weatherList
    }
}
