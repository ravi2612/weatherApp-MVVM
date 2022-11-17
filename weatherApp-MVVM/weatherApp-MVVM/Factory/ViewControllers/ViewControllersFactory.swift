//
//  ViewControllersFactory.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 08/11/22.
//

import Foundation

final class ViewControllersFactory {
    
}

extension ViewControllersFactory: ViewControllersFactoryProtocol {
    
    func makeHomeViewController() -> HomeViewController {
        let controller = HomeViewController()
        let viewModel = HomeWeatherViewModel(delegate: HomeViewController.self as? HomeWeatherViewModelDelegate)
        controller.viewModel = viewModel
        return controller
    }
    
    func makeAddWeatherViewController() -> AddWeatherViewController {
        let controller = AddWeatherViewController()
        return controller
    }
}
