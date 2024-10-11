//
//  BootcampSesion1App.swift
//  BootcampSesion1
//
//  Created by José Valderrama on 13/09/2024.
//

import SwiftUI

@main
struct BootcampSesion1App: App {
    var body: some Scene {
        WindowGroup {
            let data = 1..<5
            ContentViewScrollView(rango: data)
        }
    }
}
