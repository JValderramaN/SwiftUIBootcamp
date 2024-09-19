//
//  ContentViewObservacion.swift
//  BootcampSesion2
//
//  Created by José Valderrama on 19/09/2024.
//

import SwiftUI

// Modelado de Datos
struct Tarea: Identifiable {
    let id = UUID()
    var titulo: String
    var completada: Bool = false
}

// Fuente de Verdad y Objeto Observable
class ListaDeTareasViewModel: ObservableObject {
    @Published var tareas: [Tarea] = []
    @Published var bool1: Bool = false
    var bool2: Bool = true
    
    func agregarTarea(titulo: String) {
        let nuevaTarea = Tarea(titulo: titulo)
        tareas.append(nuevaTarea)
    }
}

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

// Vista de Fila con Binding
struct FilaDeTarea: View {
    @Binding var tarea: Tarea
    
    var body: some View {
        VStack {
            HStack {
                Text(tarea.titulo)
                Spacer()
                Button(action: {
                    tarea.completada.toggle()
                }) {
                    Image(systemName: tarea.completada ? "checkmark.square.fill" : "square")
                        .foregroundColor(tarea.completada ? .green : .gray)
                }
            }
        }
    }
}


#Preview {
    ContentViewObservacion()
}
