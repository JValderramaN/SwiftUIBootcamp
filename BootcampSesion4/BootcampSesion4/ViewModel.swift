//
//  ViewModel.swift
//  BootcampSesion4
//
//  Created by José Valderrama on 03/10/2024.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var response: WeatherResponse?
    
    @MainActor
    func loadData() async {
        do {
            response = try await API().obtenerClima()
        } catch {
            print(error)
        }
    }
}
