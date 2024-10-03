//
//  ContentViewList.swift
//  BootcampSesion1
//
//  Created by José Valderrama on 26/09/2024.
//

import SwiftUI

struct ContentViewList: View {
    let frutas = ["Manzana", "Banana", "Cereza"]
    let vegetales = ["Zanahoria", "Lechuga", "Espinaca"]

    var body: some View {
        List {
            Section(header: Text("Frutas")) {
                ForEach(frutas, id: \.self) { fruta in
                    Text(fruta)
                }
            }

            Section(header: Text("Vegetales")) {
                ForEach(vegetales, id: \.self) { vegetal in
                    Text(vegetal)
                }
            }
            
            ForEach(1..<21) { index in
                Text("Elemento \(index)")
                    .font(.title)
                    .frame(width: 300, height: 100)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}
