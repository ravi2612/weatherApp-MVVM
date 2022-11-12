//
//  BaseCoordinator.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 08/11/22.
//
//
import UIKit

class AppCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        
        let homeViewController = HomeCoordinator(navigationController: navigationController)
        
        childCoordinators.append(homeViewController)
        
        homeViewController.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
