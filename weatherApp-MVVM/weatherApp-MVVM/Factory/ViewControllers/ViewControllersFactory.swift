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
        let viewModel = HomeWeatherViewModel(delegate: HomeViewController.self as? HomeWeatherViewModelCoordinatorDelegate)
        controller.viewModel = viewModel
        return controller
    }
}
