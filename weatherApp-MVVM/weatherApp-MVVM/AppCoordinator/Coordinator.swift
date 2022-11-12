//
//  Coordinator.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 08/11/22.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] {get}
    func start()
}
