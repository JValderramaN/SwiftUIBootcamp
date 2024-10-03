//
//  ListaDeTareasViewModel.swift
//  BootcampSesion2
//
//  Created by José Valderrama on 26/09/2024.
//

import SwiftUI

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
