//
//  MainCoordinator.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 08/11/22.
//

import Foundation
import UIKit

/**
 Your app should consist of multiple coordinators, one for each scene.
 But it should always have one “main” AppCoordinator, which will be owned by the App Delegate.
 The following code is an example of a basic AppCoordinator.
 All other coordinators in the application will be children of this coordinator.
 */

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    
    let window: UIWindow?
    let factory: ViewControllersFactoryProtocol = ViewControllersFactory()
    var childCoordinators: [Coordinator] = []
    
    lazy var rootViewController: UINavigationController = {
        return UINavigationController()
    }()
    
    //  the AppCoordinator it must own the window.
    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        guard let window = window else { return }
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        homeFlow()
    }
    
    private func homeFlow(){
        let homeCoordinator = HomeCoordinator(navigationController: self.rootViewController, factory: factory)
        store(coordinator: homeCoordinator)
        homeCoordinator.start()
    }
    
    private func addWeatherViewFlow(){
        let addWeatherView = AddWeatherViewController()
    }
}

//extension AppCoordinator: LoginCoordinatorDelegate {
//
//  func didFinishLoginCordinator(coordinator: Coordinator, with user: User) {
//    self.free(coordinator: coordinator)
//    self.dashboardFlow(with: user)
//  }
//}
//extension AppCoordinator: DashboardCoordinatorDelegate {
//  func didFinishDashboardCordinator(coordinator: Coordinator) {
//    self.free(coordinator: coordinator)
//    self.loginFlow()
//  }
//}
