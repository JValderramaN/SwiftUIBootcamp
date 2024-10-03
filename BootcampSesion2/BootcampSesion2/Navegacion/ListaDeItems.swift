//
//  ListaDeItems.swift
//  BootcampSesion2
//
//  Created by José Valderrama on 26/09/2024.
//

import SwiftUI

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
