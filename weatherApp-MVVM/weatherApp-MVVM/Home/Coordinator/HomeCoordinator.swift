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

class HomeCoordinator: BaseCoordinator, HomeCoordinatorDelegate {
    
    private let navigationController: UINavigationController
    var delegate: HomeWeatherViewModelCoordinatorDelegate?
    var factory: ViewControllersFactoryProtocol
    
    init(navigationController: UINavigationController, factory: ViewControllersFactoryProtocol){
        self.navigationController = navigationController
        self.factory = factory
    }
    
    override func start() {
        let controller = self.factory.makeHomeViewController()
        self.navigationController.setViewControllers([controller], animated: false)
    }
    
//    lazy var homeController: HomeViewController = 
    
    func didFinishHomeCoordinator(coordinator: Coordinator) {
    }
}
