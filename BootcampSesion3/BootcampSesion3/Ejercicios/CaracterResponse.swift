//
//  Caracter.swift
//  BootcampSesion3
//
//  Created by José Valderrama on 26/09/2024.
//

import Foundation

struct CaracterResponse: Decodable {
    let results: [Caracter]
}

struct Caracter: Decodable {
    let id: Int
    let name: String
    let status: String
}
