//
//  Tarea.swift
//  BootcampSesion2
//
//  Created by José Valderrama on 26/09/2024.
//

import Foundation

// Modelado de Datos
struct Tarea: Identifiable {
    let id = UUID()
    var titulo: String
    var completada: Bool = false
}
