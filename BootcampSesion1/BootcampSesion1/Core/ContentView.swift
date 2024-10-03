//
//  ContentView.swift
//  BootcampSesion1
//
//  Created by José Valderrama on 13/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Header")
                .font(.largeTitle)
                .padding()

            HStack {
                VStack(alignment: .leading) {
                    Text("Nombre:")
                    Text("Edad:")
                }

                Spacer()

                VStack(alignment: .leading) {
                    Text("John Doe")
                    Text("30")
                }
            }
            .padding()

            Spacer()
            
            Text("Texto con borde redondeado")
                .padding()
                .background(Color.blue)
                .cornerRadius(10)

            Text("Footer")
                .font(.caption)
                .padding()
            
            Text("Modificado")
//                .modifier(CustomTitleModifier())
                .customTitleStyle()
        }
    }
}

#Preview {
    let data = 1..<5
    return ContentViewScrollView(rango: data)
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
