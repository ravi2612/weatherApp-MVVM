//
//  SceneDelegate.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 07/11/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var baseCoordinator: Coordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        baseCoordinator = AppCoordinator(window: window)
        baseCoordinator?.start()
    }
}

