//
//  Ejercicios.swift
//  BootcampSesion1
//
//  Created by José Valderrama on 13/09/2024.
//

import SwiftUI
class Algo {
    let data = 1..<80
}

#Preview {
    let algo = Algo()
    return ContentViewScrollView(rango: algo.data)
}
