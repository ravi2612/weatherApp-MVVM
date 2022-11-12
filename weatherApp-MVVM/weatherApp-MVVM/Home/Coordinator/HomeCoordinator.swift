//
//  HomeCoordinator.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 08/11/22.
//

import UIKit

protocol HomeCoordinatorDelegate: AnyObject {
    func didFinishHomeCoordinator(coordinator: Coordinator)
}

class HomeCoordinator: BaseCoordinator{
    
    private let navigationController: UINavigationController
    var delegate: HomeWeatherViewModelDelegate?
    var factory: ViewControllersFactoryProtocol
    
    init(navigationController: UINavigationController, factory: ViewControllersFactoryProtocol){
        self.navigationController = navigationController
        self.factory = factory
    }
    
    override func start() {
        let controller = self.factory.makeHomeViewController()
        controller.viewModel = HomeWeatherViewModel(delegate: controller)
        self.navigationController.setViewControllers([controller], animated: false)
    }
}
