//
//  ViewController.swift
//  BootcampSesion3
//
//  Created by José Valderrama on 26/09/2024.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var switchCellType: UISwitch!
    
    var results: [Caracter] = []

    @IBAction func buttonSwiftUITapped(_ sender: Any) {
        let hosting = UIHostingController(rootView: ContentView())
        present(hosting, animated: true)
    }
    
    @IBAction func buttonExerciseTapped(_ sender: Any) {
        Task {
            do {
                results = try await API().obtenerCaracters()
                print(results)
                tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        let cellType = sender.isOn ? "UIKIit" : "SwiftUI"
        switchLabel.text = "La celda es: \(cellType)"
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        let name = results[indexPath.row].name
        let index = indexPath.row
        let title = "\(index): \(name)"
        
        if switchCellType.isOn {
            cell = tableView.dequeueReusableCell(withIdentifier: "CeldaUIKit", for: indexPath)
            (cell as? CeldaUIKITTableViewCell)?.nameLabel.text = title
        } else {
            cell = .init()
            
            if #available(iOS 16.0, *) {
                cell.contentConfiguration = UIHostingConfiguration(content: {
                    let swiftUIView = CeldaSwiftUI(title: title)
                    return swiftUIView
                })
            } else {
//                cell.contentConfiguration = CeldaSwiftUIContentConfiguration(title: title)
                // TODO: lograr mostrar la celda de SwiftUI
                cell.textLabel?.text = title
            }
        }
        
        return cell
    }
}

