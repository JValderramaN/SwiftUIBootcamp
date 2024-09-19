//
//  ContentView.swift
//  BootcampSesion1
//
//  Created by José Valderrama on 13/09/2024.
//

import SwiftUI
import Kingfisher

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

extension View {
    func customTitleStyle() -> some View {
        self.modifier(CustomTitleModifier())
    }
}

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

struct AlgoNuevo: View {
    var body: some View {
        KFImage.url(.init(string: "https://blackedbyte.com/index.html/images/f497e6a95a.png"))
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
