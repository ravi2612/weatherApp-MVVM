//
//  AddWeatherCoordinator.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 11/11/22.
//

import UIKit

final class AddWeatherCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = AddWeatherViewController()
        navigationController.present(viewController, animated: true)
    }
}
