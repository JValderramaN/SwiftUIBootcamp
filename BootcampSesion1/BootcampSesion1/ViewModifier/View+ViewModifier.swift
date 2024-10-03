//
//  View+ViewModifier.swift
//  BootcampSesion1
//
//  Created by José Valderrama on 26/09/2024.
//

import SwiftUI

extension View {
    func customTitleStyle() -> some View {
        self.modifier(CustomTitleModifier())
    }
}
