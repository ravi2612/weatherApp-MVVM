//
//  AddWeatherCoordinator.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 11/11/22.
//

import UIKit

protocol AddWeatherDelegate {
    func didFinishAddWeatherCoordinator(coordinator: Coordinator)
}

final class AddWeatherCoordinator: BaseCoordinator {
    
    var delegate: AddWeatherDelegate?
    var factory: ViewControllersFactoryProtocol
    
    init(delegate: AddWeatherDelegate?, factory: ViewControllersFactoryProtocol) {
        self.delegate = delegate
        self.factory = factory
    }
}
