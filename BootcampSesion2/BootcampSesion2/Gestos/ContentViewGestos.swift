//
//  ContentViewGestos.swift
//  BootcampSesion2
//
//  Created by José Valderrama on 19/09/2024.
//

import SwiftUI

// Vista Principal Gestos
struct ContentViewGestos: View {
    @State private var circlePosition: CGPoint = .zero

    var body: some View {
        VStack {
            Text("Posición del Círculo: x: \(Int(circlePosition.x)), y: \(Int(circlePosition.y))")
                .padding()

            ZStack {
                Rectangle()
                    .fill(Color.blue.opacity(0.1))

                DraggableCircleView()
                    .onPreferenceChange(CirclePositionPreferenceKey.self) { value in
                        self.circlePosition = value
                    }
            }
            .frame(height: 400)
            .border(Color.blue, width: 2)
        }
    }
}

#Preview {
    ContentViewGestos()
}
