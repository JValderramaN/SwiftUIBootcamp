//
//  EquatableViewExample.swift
//  BootcampSesion5
//
//  Created by José Valderrama on 17/10/2024.
//

import SwiftUI

struct Product: Identifiable {
    let id: Int
    let name: String
    var price: Double
}

class ProductViewModel: ObservableObject {
    @Published var product: Product = Product(id: 1, name: "Producto A", price: 9.99)
}

struct EquatableViewExample: View {
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        let _ = Self._printChanges()
        
        VStack(spacing: 20) {
            ProductDetailView(product: viewModel.product)
            
            Divider()
            
            EquatableView(content: EquatableProductDetailView(product: viewModel.product))
            
            Divider()
            
            Button("Actualizar Precio") {
                viewModel.product.price += 1.0
            }
            
            Button("Actualizar Producto (sin cambios)") {
                viewModel.product = viewModel.product
            }
        }
        .padding()
    }
}

struct ProductDetailView: View {
    let product: Product
    
    var body: some View {
        let _ = Self._printChanges()
        
        VStack {
            Text("Original")
            Text("Nombre: \(product.name)")
            Text(String(format: "Precio: $%.2f", product.price))
        }
        .padding()
        .background(Color.orange.opacity(0.1))
    }
}

struct EquatableProductDetailView: View, Equatable {
    let product: Product
    
    static func == (lhs: EquatableProductDetailView, rhs: EquatableProductDetailView) -> Bool {
        lhs.product.id == rhs.product.id
    }
    
    var body: some View {
        let _ = Self._printChanges()
        
        VStack {
            Text("Nombre: \(product.name)")
            Text(String(format: "Precio: $%.2f", product.price))
        }
        .padding()
        .background(Color.purple.opacity(0.1))
    }
}

#Preview {
    EquatableViewExample()
}
