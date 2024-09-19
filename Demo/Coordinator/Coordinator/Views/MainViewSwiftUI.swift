//
//  MainViewSwiftUI.swift
//  Coordinator
//
//  Created by José Valderrama on 11/09/2024.
//

import SwiftUI

struct MainViewSwiftUI: View {
    @EnvironmentObject var coordinator: CoordinatorViewModel
    @State var text: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            Text("Main Screen")
                .padding(.bottom)
            
            Button("Go to Screen 1") {
                coordinator.process(routes: [.init(destination: .screen1, transition: .push(replacing: true))])
            }
            
            HStack {
                TextField("enter a message", text: $text)
                Button("Go to Screen 2") {
                    coordinator.process(routes: [.init(destination: .screen2(message: text.isEmpty ? "Screen 2" : text), transition: .sheet)])
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    MainViewSwiftUI()
}
