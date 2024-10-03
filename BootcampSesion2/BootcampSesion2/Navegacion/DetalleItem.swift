//
//  DetalleItem.swift
//  BootcampSesion2
//
//  Created by José Valderrama on 26/09/2024.
//

import SwiftUI

// Detalle de la celda
struct DetalleItem: View {
    let item: Int
    
    var body: some View {
        Text("Detalle del Item \(item)")
            .font(.largeTitle)
            .navigationTitle("Item \(item)")
    }
}
