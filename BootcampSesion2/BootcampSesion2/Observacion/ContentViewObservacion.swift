//
//  ContentViewObservacion.swift
//  BootcampSesion2
//
//  Created by José Valderrama on 19/09/2024.
//

import SwiftUI

// Vista Principal Observacion
struct ContentViewObservacion: View {
    @StateObject var listaDeTareasVM = ListaDeTareasViewModel()
    @State private var nuevoTitulo = ""
    
    var body: some View {
        let _ = Self._printChanges()
         
        NavigationView {
            VStack {
                Text("Valor del state: \(nuevoTitulo) \(listaDeTareasVM.bool1)")
                
                HStack {
                    TextField("Nueva tarea", text: $nuevoTitulo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        listaDeTareasVM.agregarTarea(titulo: nuevoTitulo)
                        nuevoTitulo = ""
                    }) {
                        Text("Agregar")
                    }
                }
                .padding()
                
                let completadas = listaDeTareasVM.tareas.filter({ $0.completada }).count
                
                Text("Completadas: \(completadas)")
                
                Button("Toogle bool1") {
                    listaDeTareasVM.bool1.toggle()
                }
                
                List {
                    ForEach($listaDeTareasVM.tareas) { $tarea in
                        FilaDeTarea(tarea: $tarea)
                    }
                }
            }
            .navigationTitle("Lista de Tareas")
        }
        .onChange(of: listaDeTareasVM.bool1) { value in
            print("el nuevo valor es: \(value)")
            listaDeTareasVM.agregarTarea(titulo: "tocada por toogle")
        }
    }
}


#Preview {
    ContentViewObservacion()
}
