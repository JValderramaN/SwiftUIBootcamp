//
//  PoorPerformanceExample.swift
//  BootcampSesion5
//
//  Created by José Valderrama on 17/10/2024.
//

import SwiftUI

// **** problema original donde todas visibles las celdas se recargan al cambiar una sola

//struct PoorPerformanceExample: View {
//    @State private var items: [Item] = (1...100).map { Item(id: $0, name: "Item \($0)", isSelected: false) }
//    
//    var body: some View {
//        let _ = Self._printChanges()
//        
//        NavigationView {
//            List {
//                ForEach($items) { $item in
//                    ItemRowView(item: $item)
//                }
//            }
//            .navigationTitle("Items")
//        }
//    }
//}
//
//struct Item: Identifiable {
//    let id: Int
//    var name: String
//    var isSelected: Bool
//}
//
//struct ItemRowView: View {
//    @Binding var item: Item
//    
//    var body: some View {
//        let _ = Self._printChanges()
//        print("Renderizando ItemRowView para \(item.name)")
//        
//        return HStack {
//            Text(item.name)
//            Spacer()
//            Button(action: {
//                item.isSelected.toggle()
//            }) {
//                Image(systemName: item.isSelected ? "checkmark.circle.fill" : "circle")
//            }
//        }
//        .padding()
//    }
//}


// **** fixed opcion 1, usar clase

struct PoorPerformanceExample: View {
    @State private var items: [Item] = (1...100).map { Item(id: $0, name: "Item \($0)", isSelected: false) }

    var body: some View {
        let _ = Self._printChanges()

        NavigationView {
            List {
                ForEach(items) { item in
                    AnyView(ItemRowView(item: item))
                }
            }
            .navigationTitle("Items")
        }
    }
}

class Item: Identifiable, ObservableObject {
    let id: Int
    var name: String
    @Published var isSelected: Bool

    init(id: Int, name: String, isSelected: Bool) {
        self.id = id
        self.name = name
        self.isSelected = isSelected
    }
}

struct ItemRowView: View {
    @ObservedObject var item: Item

    var body: some View {
        let _ = Self._printChanges()

        return HStack {
            Text(item.name)
            Spacer()
            Button(action: {
                print("si se ejecuta")
                item.isSelected.toggle()
            }) {
                Image(systemName: item.isSelected ? "checkmark.circle.fill" : "circle")
            }
        }
        .padding()
    }
}

// **** fixed opcion 2, usar EquatableView

//struct PoorPerformanceExample: View {
//    @State private var items: [Item] = (1...100).map { Item(id: $0, name: "Item \($0)", isSelected: false) }
//
//    var body: some View {
//        let _ = Self._printChanges()
//
//        NavigationView {
//            List {
//                ForEach($items) { $item in
//                    EquatableView(content: ItemRowView(item: $item))
//                }
//            }
//            .navigationTitle("Items")
//        }
//    }
//}
//
//struct Item: Identifiable {
//    let id: Int
//    var name: String
//    var isSelected: Bool
//}
//
//struct ItemRowView: View, Equatable {
//
//    @Binding var item: Item
//
//    var body: some View {
//        let _ = Self._printChanges()
//
//        return HStack {
//            Text(item.name)
//            Spacer()
//            Button(action: {
//                item.isSelected.toggle()
//            }) {
//                Image(systemName: item.isSelected ? "checkmark.circle.fill" : "circle")
//            }
//        }
//        .padding()
//    }
//
//    static func == (lhs: ItemRowView, rhs: ItemRowView) -> Bool {
//        lhs.item.isSelected == rhs.item.isSelected
//    }
//}

#Preview {
    PoorPerformanceExample()
}
