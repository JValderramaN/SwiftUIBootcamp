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
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    apiService.fetchData { result in
                        print("after completion at \(Date.now)")
                        
                        switch result {
                        case .success(let fetchedData):
                            DispatchQueue.main.async {
                                self.data = fetchedData
                            }
                        case .failure(let error):
                            DispatchQueue.main.async {
                                self.data = "Error: \(error.localizedDescription)"
                            }
                        }
                    }
                }
            }
            .padding(.bottom, 50)
            
            Text(data)
                .onAppear {
                    apiService.fetchData { result in
                        print("after completion at \(Date.now)")
                        
                        switch result {
                        case .success(let fetchedData):
                            DispatchQueue.main.async {
                                self.data = fetchedData
                            }
                        case .failure(let error):
                            DispatchQueue.main.async {
                                self.data = "Error: \(error.localizedDescription)"
                            }
                        }
                    }
                }
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
}

enum APIError: Error {
    case invalidURL
    case invalidData
}

#Preview {
    CallbackToContinuation()
}
