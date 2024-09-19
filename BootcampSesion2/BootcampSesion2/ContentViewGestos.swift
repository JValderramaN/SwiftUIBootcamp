//
//  ContentViewGestos.swift
//  BootcampSesion2
//
//  Created by José Valderrama on 19/09/2024.
//

import SwiftUI

// PreferenceKey para la posición
struct CirclePositionPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
        value = nextValue()
    }
}

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

// Vista del Círculo Arrastrable
struct DraggableCircleView: View {
    @State private var offset: CGSize = .zero

    var body: some View {
        GeometryReader { geometry in
            let circleSize: CGFloat = 50
            let minX = circleSize / 2
            let maxX = geometry.size.width - circleSize / 2
            let minY = circleSize / 2
            let maxY = geometry.size.height - circleSize / 2

            Circle()
                .fill(Color.red)
                .frame(width: circleSize, height: circleSize)
                .position(x: offset.width, y: offset.height)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            var newX = gesture.location.x
                            var newY = gesture.location.y

                            // Restringir el movimiento dentro del área
                            if newX < minX { newX = minX }
                            if newX > maxX { newX = maxX }
                            if newY < minY { newY = minY }
                            if newY > maxY { newY = maxY }

                            offset = CGSize(width: newX, height: newY)
                        }
                )
                .onAppear {
                    // Posicionar el círculo en el centro al inicio
                    offset = CGSize(width: geometry.size.width / 2, height: geometry.size.height / 2)
                }
                .preference(key: CirclePositionPreferenceKey.self, value: CGPoint(x: offset.width, y: offset.height))
        }
    }
}

#Preview {
    ContentViewGestos()
}
