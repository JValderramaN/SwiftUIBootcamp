//
//  CustomTitleModifier.swift
//  BootcampSesion1
//
//  Created by José Valderrama on 26/09/2024.
//

import SwiftUI

struct CustomTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
            .padding()
            .background(Color.yellow)
            .cornerRadius(10)
    }
}


