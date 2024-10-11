//
//  FilaDeTarea.swift
//  BootcampSesion2
//
//  Created by José Valderrama on 26/09/2024.
//

import SwiftUI

// Vista de Fila con Binding
struct FilaDeTarea: View {
    @Binding var tarea: Tarea
    
    var body: some View {
        let _ = Self._printChanges()
        
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
