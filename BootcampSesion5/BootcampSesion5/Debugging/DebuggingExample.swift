//
//  DebuggingExample.swift
//  BootcampSesion5
//
//  Created by José Valderrama on 17/10/2024.
//

import SwiftUI

class StateObjectModel: ObservableObject {
    @Published var propertyOne: String = "Valor Inicial 1"
    @Published var propertyTwo: Int = 0
}

class ObservedObjectModel: ObservableObject {
    @Published var propertyOne: String = "Valor Inicial A"
    @Published var propertyTwo: Int = 0
}

struct DebuggingExample: View {
    @State private var stateVariable: Int = 0
    @StateObject private var stateObjectModel = StateObjectModel()
    @ObservedObject var observedObjectModel: ObservedObjectModel
    
    var body: some View {
        let _ = Self._printChanges()
        
        VStack(spacing: 20) {
            Text("State Variable: \(stateVariable)")
            Button("Incrementar State Variable") {
                stateVariable += 1
            }
            
            Divider()
            
            Text("StateObjectModel.propertyOne: \(stateObjectModel.propertyOne)")
            Text("StateObjectModel.propertyTwo: \(stateObjectModel.propertyTwo)")
            Button("Actualizar StateObjectModel") {
                stateObjectModel.propertyOne = "Valor Actualizado 1"
                stateObjectModel.propertyTwo += 1
            }
            
            Divider()
            
            Text("ObservedObjectModel.propertyOne:")
            SubView(text: $observedObjectModel.propertyOne)
//            SubViewWithFullObject(observedObjectModel: observedObjectModel)
            Text("ObservedObjectModel.propertyTwo: \(observedObjectModel.propertyTwo)")
            Button("Incrementar ObservedObjectModel.propertyTwo") {
                observedObjectModel.propertyTwo += 1
            }
        }
        .padding()
        .onReceive(stateObjectModel.$propertyOne) { newValue in
            print("stateObjectModel.propertyOne cambió a: \(newValue)")
        }
        .onReceive(stateObjectModel.$propertyTwo) { newValue in
            print("stateObjectModel.propertyTwo cambió a: \(newValue)")
        }
        .onReceive(observedObjectModel.$propertyOne) { newValue in
            print("observedObjectModel.propertyOne cambió a: \(newValue)")
        }
        .onReceive(observedObjectModel.$propertyTwo) { newValue in
            print("observedObjectModel.propertyTwo cambió a: \(newValue)")
        }
    }
}

struct SubView: View {
    @Binding var text: String
    
    var body: some View {
        let _ = Self._printChanges()
        
        TextField("Ingrese texto", text: $text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
    }
}

struct SubViewWithFullObject: View {
    @ObservedObject var observedObjectModel: ObservedObjectModel
    
    var body: some View {
        let _ = Self._printChanges()
        
        TextField("Ingrese texto", text: $observedObjectModel.propertyOne)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
    }
}

#Preview {
    let observedObjectModel = ObservedObjectModel()
    return DebuggingExample(observedObjectModel: observedObjectModel)
}
