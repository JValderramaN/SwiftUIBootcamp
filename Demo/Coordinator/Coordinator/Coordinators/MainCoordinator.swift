//
//  Coordinator.swift
//  MainCoordinator
//
//  Created by José Valderrama on 11/09/2024.
//

import UIKit

protocol CoordinatorUIkit {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [CoordinatorUIkit] { get set }
}

class CoordinatorA: CoordinatorUIkit {
    var navigationController: UINavigationController
    var childCoordinators: [CoordinatorUIkit]
    
    init(navigationController: UINavigationController = UINavigationController(), childCoordinators: [CoordinatorUIkit] = []) {
        self.navigationController = navigationController
        self.childCoordinators = childCoordinators
    }
}

class CoordinatorB: CoordinatorUIkit {
    var navigationController: UINavigationController
    var childCoordinators: [CoordinatorUIkit]
    
    init(navigationController: UINavigationController = UINavigationController(), childCoordinators: [CoordinatorUIkit] = []) {
        self.navigationController = navigationController
        self.childCoordinators = childCoordinators
    }
}

class MainCoordinator: CoordinatorUIkit {

    var navigationController: UINavigationController
    var childCoordinators: [CoordinatorUIkit]
    
    init(navigationController: UINavigationController = UINavigationController(), childCoordinators: [CoordinatorUIkit] = []) {
        self.navigationController = navigationController
        self.childCoordinators = childCoordinators
    }
    
    func start() {
        let viewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "MainViewController")
            as! MainViewController
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }

    func showScreen1() {
        let viewController = UIStoryboard(name: "Screens", bundle: nil)
            .instantiateViewController(withIdentifier: "Screen1ViewController")
            as! Screen1ViewController
        navigationController.pushViewController(viewController, animated: true)
    }

    func showScreen2(message: String?) {
        let viewController = UIStoryboard(name: "Screens", bundle: nil)
            .instantiateViewController(withIdentifier: "Screen2ViewController")
            as! Screen2ViewController
        viewController.setup(message: message)
        navigationController.pushViewController(viewController, animated: true)
    }

}
