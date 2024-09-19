//
//  AppViewSwiftUI.swift
//  Coordinator
//
//  Created by José Valderrama on 11/09/2024.
//

import SwiftUI

@main
struct AppViewSwiftUI: App {
    var body: some Scene {
        WindowGroup {
            CoordinatorView(content: MainViewSwiftUI())
        }
    }
}
