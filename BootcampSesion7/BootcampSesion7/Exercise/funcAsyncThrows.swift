//
//  funcAsyncThrows.swift
//  BootcampSesion7
//
//  Created by José Valderrama on 24/10/2024.
//

import Foundation

func retornaUnValor() async throws -> Int {
    try await Task.sleep(nanoseconds: 1_000_000_000)
    
    return 0
}

func otraFuncion() async throws {
    // se espera una por una
//    let valor = try await retornaUnValor()
//    let valor1 = try await retornaUnValor()
//    let valor2 = try await retornaUnValor()
//    let valor3 = try await retornaUnValor()
    
    // no se ejecuta ninguno hasta que haya un "await"
    async let valor = try retornaUnValor()
    async let valor1 = try retornaUnValor()
    async let valor2 = try retornaUnValor()
    async let valor3 = try retornaUnValor()
    let arreglo = try await [valor, valor1, valor2, valor3]
    print(arreglo)
}
