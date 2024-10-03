//
//  API.swift
//  BootcampSesion3
//
//  Created by José Valderrama on 26/09/2024.
//

import Foundation

struct API {

    func obtenerCaracters() async throws -> [Caracter]  {
        let url = "https://rickandmortyapi.com/api/character"
        guard let url = URL(string: url) else {
            return []
        }
        
        let responseTuple = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let model = try decoder.decode(CaracterResponse.self, from: responseTuple.0)
        return model.results
    }
}
