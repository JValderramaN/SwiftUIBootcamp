//
//  AppDelegate.swift
//  Coordinator
//
//  Created by José Valderrama on 11/09/2024.
//

import UIKit

//@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let coordinator = MainCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {        
        coordinator.start()
        window = .init()
        window?.makeKeyAndVisible()
        window?.rootViewController = coordinator.navigationController
        return true
    }


}

