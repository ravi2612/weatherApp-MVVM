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
    
    var delegate: HomeWeatherViewModelDelegate?
    var coordinator: HomeCoordinator?
    
    var weatherList: [HomeWeatherModel]? = [HomeWeatherModel(city: "Fortaleza", temp: "32°C"), HomeWeatherModel(city: "São Paulo", temp: "17°C")]
    
    init(delegate: HomeWeatherViewModelDelegate?) {
        self.delegate = delegate
        self.delegate?.weatherloaded(true)
    }
    
    func showAddWeatherView(){
        coordinator?.startAddWeatherView()
    }
}
