//
//  SomeViewExample.swift
//  BootcampSesion6
//
//  Created by José Valderrama on 17/10/2024.
//

import SwiftUI


// Código que no funciona, ya que la funcion pide que se retorne 1 solo View y hay posibilidad de retornar 2 tipos de view.
//func someViewExample2(flag: Bool) -> some View {
//    if flag {
//        return Text("Verdadero")
//    } else {
//        return Image(systemName: "xmark")
//    }
//}

// Codigo que sí funciona, ya que se retorna un solo tipo de dato finalmente "Group", pudo haber sido "HStack" o similares
func someViewExample(flag: Bool) -> some View {
    return Group {
        if flag {
            Text("Verdadero")
        } else {
            Image(systemName: "xmark")
        }
    }
}
