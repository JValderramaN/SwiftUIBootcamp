//
//  ConditionalView.swift
//  BootcampSesion1
//
//  Created by José Valderrama on 26/09/2024.
//

import SwiftUI

struct ConditionalView<Content: View>: View {
    let condition: Bool
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        if condition {
            content()
        } else {
            Text("Condición es Falsa")
                .foregroundColor(.blue)
        }
    }
}

struct ContentViewConditional: View {
    var body: some View {
        VStack {
            ConditionalView(condition: true) {
                Text("Esto es verdadero")
            }
            
            ConditionalView(condition: false) {
                Text("No se mostrará este texto")
                    .foregroundColor(.red)
            }
        }
    }
}
