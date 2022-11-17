//
//  HomeCoordinator.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 08/11/22.
//

import UIKit

class HomeCoordinator: Coordinator{
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController()
        let homeWeatherViewmodel = HomeWeatherViewModel(delegate: homeViewController)
        homeViewController.viewModel = homeWeatherViewmodel
        homeWeatherViewmodel.coordinator = self
        navigationController.setViewControllers([homeViewController], animated: false)
    }
    
    func startAddWeatherView(_ delegate: AddWeatherObjcDelegate){
        let addWeatherView = AddWeatherCoordinator(navigationController: navigationController, delegate: delegate)
        childCoordinators.append(addWeatherView)
        addWeatherView.start()
    }
}
