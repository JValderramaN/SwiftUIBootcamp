//
//  ContentViewNavegation.swift
//  BootcampSesion2
//
//  Created by José Valderrama on 19/09/2024.
//

import SwiftUI

// Vista Principal Navegation
struct ContentViewNavegation: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            // Uso de NavigationStack en iOS 16 o superior con .navigationDestination
            NavigationStack {
                ListaDeItems()
                    .navigationTitle("Lista de Items")
            }
        } else {
            // Uso de NavigationView en versiones anteriores
            NavigationView {
                ListaDeItems()
                    .navigationTitle("Lista de Items")
            }
        }
    }
}

// Lista de items para mostrar
struct ListaDeItems: View {
    let items = Array(1...10)
    
    var body: some View {
        List(items, id: \.self) { item in
            if #available(iOS 16.0, *) {
                // NavigationLink sin destino, usando .navigationDestination más adelante
                NavigationLink(value: item) {
                    Text("Item posterior a iOS 16: \(item)")
                }
            } else {
                // NavigationLink tradicional con destino
                NavigationLink(destination: DetalleItem(item: item)) {
                    Text("Item iOS anterior a 16: \(item)")
                }
            }
        }
        .modifier(NavigationDestinationModifier())
    }
}

// Modificador personalizado para manejar .navigationDestination
struct NavigationDestinationModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .navigationDestination(for: Int.self) { item in
                    print("navigationDestination \(item)")
                    return DetalleItem(item: item)
                }
        } else {
            content
        }
    }
}

// Detalle de la celda
struct DetalleItem: View {
    let item: Int
    
    var body: some View {
        Text("Detalle del Item \(item)")
            .font(.largeTitle)
            .navigationTitle("Item \(item)")
    }
}


#Preview {
    ContentViewNavegation()
}
