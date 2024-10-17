//
//  ContentView.swift
//  BootcampSesion6
//
//  Created by José Valderrama on 17/10/2024.
//

import SwiftUI

struct ContentView: View {
    let stack: Stack<CustomStringConvertible>
    
    var body: some View {
        VStack {
            Text("Stack values:")
                .padding(.bottom)
            ForEach(stack.items, id: \.description) { element in
                Text(element.description)
            }
        }
        .padding()
    }
    
    
}

#Preview("Generic Model") {
    let stack = Stack<CustomStringConvertible>()
    stack.push("uno")
    stack.push(2)
    stack.push("3 tres")
    stack.push(NumeroStruct(value: 4))
    return ContentView(stack: stack)
}

#Preview("Generic View") {
    GenericViewExample()
}

#Preview("some View") {
    VStack {
        someViewExample(flag: true)
        someViewExample(flag: false)
    }
}

#Preview("AnyView") {
    VStack {
        anyViewExample(flag: true)
        anyViewExample(flag: false)
    }
}
