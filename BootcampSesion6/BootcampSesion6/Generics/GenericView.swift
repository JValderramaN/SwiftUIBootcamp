//
//  GenericView.swift
//  BootcampSesion6
//
//  Created by José Valderrama on 17/10/2024.
//

import SwiftUI

struct PairView<FirstContent: View, SecondContent: View>: View {
    let firstContent: FirstContent
    let secondContent: SecondContent

    var body: some View {
        HStack {
            firstContent
            secondContent
        }
    }
}

struct GenericButton<Label: View>: View {
    let action: () -> Void
    let label: Label

    var body: some View {
        Button(action: action) {
            label
        }
    }
}

struct GenericViewExample: View {
    var body: some View {
        let image = Image(systemName: "star")
        let text = Text("Estrella")
        let forEach = ForEach((1...5), id: \.self) { value in
            Text("Value: \(value)")
        }
        let stack = VStack {
            text
            forEach
        }
        
        let pairView = PairView(
            firstContent: image,
            secondContent: stack
        )
        let button = GenericButton(action: {
            print("tapped")
        }, label: pairView)
        
        return HStack {
            pairView
            button
        }
    }
}

