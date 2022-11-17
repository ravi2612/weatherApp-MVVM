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
    private var delegate: AddWeatherObjcDelegate?
    
    init(navigationController: UINavigationController, delegate: AddWeatherObjcDelegate) {
        self.navigationController = navigationController
        self.delegate = delegate
    }
    
    func start() {
        let viewController = AddWeatherViewController()
        let viewModel = AddWeatherViewModel(delegate: viewController, coordinator: self)
        viewController.viewModel = viewModel
        viewModel.delegateObjc = self.delegate
        navigationController.present(viewController, animated: true)
    }
    
    func dismiss(){
        navigationController.dismiss(animated: true)
    }
}
