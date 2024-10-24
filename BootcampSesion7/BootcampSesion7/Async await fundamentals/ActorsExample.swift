//
//  ActorsExample.swift
//  BootcampSesion7
//
//  Created by José Valderrama on 24/10/2024.
//

import Foundation
import Combine
import SwiftUI

struct ActorsExample: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Counter: \(viewModel.count)")
                .font(.largeTitle)
            
            Button("Increment Counter") {
                Task {
                    await viewModel.incrementCounter()
                }
            }
            
            Button("Fetch Data") {
                Task {
                    await viewModel.fetchData()
                }
            }
            
            Text(viewModel.dataMessage)
                .padding()
        }
        .padding()
    }
}

@MainActor
class ViewModel: ObservableObject {
    @Published var count: Int = 0
    @Published var dataMessage: String = ""
    
    private let counterActor = CounterActor()
    
    func incrementCounter() async {
        await counterActor.increment()
        count = await counterActor.currentCount
    }
    
    func fetchData() async {
        do {
            // Using async throwing function
            // let data = try await counterActor.fetchData()
            
            // Using adaptation of completion handler using Continuations
            let data = try await counterActor.fetchDataWithContinuation()
            dataMessage = data
        } catch {
            dataMessage = "Error fetching data: \(error.localizedDescription)"
        }
    }
}

// Actor that manages a shared counter
actor CounterActor {
    private var count: Int = 0
    
    // Async function to increment the counter
    func increment() {
        count += 1
    }
    
    // Async property to get the current count
    var currentCount: Int {
        get {
            return count
        }
    }
    
    var someOtherValue: Int {
        get async {
            return 10
        }
    }
    
    // no compila porque no es ambiente async
//    func broken() {
//        if someOtherValue == 0 {
//          print("error")
//        }
//    }
    
    // Async throwing function that simulates fetching data
    func fetchData() async throws -> String {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 1_000_000_000)
        if Bool.random() {
            return "Data fetched successfully!"
        } else {
            throw URLError(.badServerResponse)
        }
    }
    
    // Adaptation of completion handler using Continuations
    func fetchDataWithContinuation() async throws -> String {
        try await withCheckedThrowingContinuation { continuation in
            fetchDataWithCompletion { result, error in
                if let result = result {
                    continuation.resume(returning: result)
                } else if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(throwing: URLError(.unknown))
                }
            }
        }
    }
    
    // Simulated function with completion handler
    private func fetchDataWithCompletion(completion: @escaping (String?, Error?) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            if Bool.random() {
                completion("Data fetched with completion handler!", nil)
            } else {
                completion(nil, URLError(.badServerResponse))
            }
        }
    }
}

#Preview {
    ActorsExample()
}
