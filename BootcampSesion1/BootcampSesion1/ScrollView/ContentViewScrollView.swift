//
//  ContentViewScrollView.swift
//  BootcampSesion1
//
//  Created by José Valderrama on 26/09/2024.
//

import SwiftUI

struct ContentViewScrollView: View {
    let rango: Range<Int>
    var body: some View {
        ScrollView() {
            Color.red
                .frame(height: 600)
            Color.blue
                .frame(height: 600)
            
            VStack(spacing: 20) {
                ForEach(rango) { index in
                    Text("Elemento \(index)")
                        .font(.title)
                        .frame(width: 300, height: 100)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}
