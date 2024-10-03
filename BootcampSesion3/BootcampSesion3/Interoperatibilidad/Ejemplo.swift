//
//  SliderFromUIKIT.swift
//  BootcampSesion3
//
//  Created by José Valderrama on 26/09/2024.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Vista de SwiftUI")
                    .font(.largeTitle)
                    .padding()

                NavigationLink(destination: UIKitViewControllerRepresentable()) {
                    Text("Ir a Vista de UIKit")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
            .navigationTitle("Inicio SwiftUI")
        }
    }
}

struct UIKitViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return UIKitViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

class UIKitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Vista de UIKit"
        view.backgroundColor = .systemBackground

        let label = UILabel()
        label.text = "Vista de UIKit"
        label.font = UIFont.systemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false

        let button = UIButton(type: .system)
        button.setTitle("Ir a Vista de SwiftUI", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(irASwiftUIView), for: .touchUpInside)

        view.addSubview(label)
        view.addSubview(button)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20)
        ])
    }

    @objc func irASwiftUIView() {
        let swiftUIView = SwiftUIDetailView()
        let hostingController = UIHostingController(rootView: swiftUIView)
        navigationController?.pushViewController(hostingController, animated: true)
    }
}


struct SwiftUIDetailView: View {
    var body: some View {
        VStack {
            Text("Detalle en SwiftUI")
                .font(.largeTitle)
                .padding()

            Text("Esta es una vista de SwiftUI dentro de UIKit")
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(8)
        }
        .navigationTitle("Detalle SwiftUI")
    }
}



#Preview {
    ContentView()
}
