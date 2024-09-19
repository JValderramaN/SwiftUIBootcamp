//
//  MainViewController.swift
//  Coordinator
//
//  Created by José Valderrama on 11/09/2024.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var textfield: UITextField!
    weak var coordinator: MainCoordinator?

    @IBAction func goToScreen1(_ sender: Any) {
        coordinator?.showScreen1()
    }
    
    @IBAction func goToScreen2(_ sender: Any) {
        coordinator?.showScreen2(message: textfield.text)
    }
}

