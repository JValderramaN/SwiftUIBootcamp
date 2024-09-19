//
//  Screen2ViewController.swift
//  Coordinator
//
//  Created by José Valderrama on 11/09/2024.
//

import UIKit

class Screen2ViewController: UIViewController {
    
    @IBOutlet private weak var labelMessage: UILabel!
    
    func setup(message: String?) {
        loadViewIfNeeded()
        labelMessage.text = message?.isEmpty ?? true ? "Screen 2" : message
    }

}
