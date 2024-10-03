//
//  NavigationDestinationModifier.swift
//  BootcampSesion2
//
//  Created by José Valderrama on 26/09/2024.
//

import SwiftUI

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
