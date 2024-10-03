//
//  Model.swift
//  BootcampSesion4
//
//  Created by José Valderrama on 03/10/2024.
//

import Foundation

struct WeatherResponse: Decodable {
    let location: Location
    let current: Current
}

extension WeatherResponse {
    struct Location: Decodable {
        let name: String
        let region: String
        let country: String
        let localtime: String
    }
    
    struct Current: Decodable {
        let humidity: Double
        let cloud: Double
        let condition: Condition
        
        struct Condition: Decodable {
            let icon: String
            var fullIconPath: String {
                "https:" + icon
            }
        }
    }
    
}
