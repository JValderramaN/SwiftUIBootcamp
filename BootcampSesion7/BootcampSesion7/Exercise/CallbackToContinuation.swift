//
//  CallbackToContinuation.swift
//  BootcampSesion7
//
//  Created by José Valderrama on 24/10/2024.
//

import SwiftUI

struct CallbackToContinuation: View {
    @State private var data: String = "Cargando..."
    let apiService = APIService()
    
    var body: some View {
        VStack {
            Button("Reload") {
                self.data = "Cargando..."
//                print("button touched at \(Date.nowFormatted)")
                
                // lo de antes, con callback y dispatchQueue
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                    apiService.fetchData { result in
//                        print("after completion at \(Date.now)")
//
//                        switch result {
//                        case .success(let fetchedData):
//                            DispatchQueue.main.async {
//                                self.data = fetchedData
//                            }
//                        case .failure(let error):
//                            DispatchQueue.main.async {
//                                self.data = "Error: \(error.localizedDescription)"
//                            }
//                        }
//                    }
//                }
                
                // el despues usando Task con main actor.run llamando a la funcion con callback
//                Task {
//                    print("print main actor run")
//                    try await Task.sleep(nanoseconds: 2_000_000_000)
//                    await MainActor.run {
//                        apiService.fetchData() { result in
//                            processResult(result)
//                        }
//                    }
//                }
                
                // el despues usando Task con main actor como anotacion en la task llamando a la funcion async.
                // no es necesario el MainActor aca porque el gesto de un boton es recibida en el hilo pricipal
//                Task { @MainActor in
//                print("print task main actor")
//                    try await Task.sleep(nanoseconds: 2_000_000_000)
//                    let result = await apiService.fetchDataRefactored()
//                    processResult(result)
//                }
                
                
                // usando un background para provocar un problema de acceso en UI
                DispatchQueue.global().async {
                    Task {
                        print("print task main actor")
                        try await Task.sleep(nanoseconds: 2_000_000_000)
                        let result = await apiService.fetchDataRefactored()
                        processResult(result)
                    }
                }
                
            }
            .padding(.bottom, 50)
            
            Text(data)
                .onAppear {
                    // lo de antes, con callback
//                    apiService.fetchData { result in
//                        print("after completion at \(Date.now)")
//                        
//                        switch result {
//                        case .success(let fetchedData):
//                            DispatchQueue.main.async {
//                                self.data = fetchedData
//                            }
//                        case .failure(let error):
//                            DispatchQueue.main.async {
//                                self.data = "Error: \(error.localizedDescription)"
//                            }
//                        }
//                    }
                    
                    
                    // lo nuevo, usando task y metodo async
                    Task {
                        let result = await apiService.fetchDataAsync()
                        processResult(result)
                    }
                }
        }
    }
    
    func processResult(_ result: Result<String, Error>) {
        switch result {
        case .success(let fetchedData):
//            DispatchQueue.main.async {
                self.data = fetchedData
//            }
        case .failure(let error):
//            DispatchQueue.main.async {
                self.data = "Error: \(error.localizedDescription)"
//            }
        }
    }
}

class APIService {
    func fetchData(completion: @escaping (Result<String, Error>) -> Void) {
        let urlString = "https://api.weatherapi.com/v1/current.json?key=fe2434c0cd1b480cac8162214222712&q=London&aqi=no"
        guard let url = URL(string: urlString) else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        print("before completion at \(Date.now)")
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, let resultString = String(data: data, encoding: .utf8) else {
                completion(.failure(APIError.invalidData))
                return
            }
            
            completion(.success(resultString))
        }
        task.resume()
    }
    
    // usando continuation
    func fetchDataAsync() async -> Result<String, Error> {
        print("fetchDataAsync")
        return await withCheckedContinuation { continuation in
            fetchData { result in
                continuation.resume(returning: result)
            }
        }
    }
    
    func fetchDataRefactored() async -> Result<String, Error> {
        let urlString = "https://api.weatherapi.com/v1/current.json?key=fe2434c0cd1b480cac8162214222712&q=London&aqi=no"
        guard let url = URL(string: urlString) else {
            return .failure(APIError.invalidURL)
        }
        
        print("1before completion at \(Date.now)")
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let resultString = String(data: data, encoding: .utf8) {
                return .success(resultString)
            } else {
                return .failure(APIError.invalidData)
            }
        }
        catch {
            return .failure(error)
        }
    }
}

enum APIError: Error {
    case invalidURL
    case invalidData
}

#Preview {
    CallbackToContinuation()
}
