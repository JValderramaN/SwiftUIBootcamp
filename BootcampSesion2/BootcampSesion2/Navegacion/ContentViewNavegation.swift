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

#Preview {
    ContentViewNavegation()
}
