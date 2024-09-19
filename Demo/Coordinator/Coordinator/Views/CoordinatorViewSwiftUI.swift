//
//  CoordinatorViewSwiftUI.swift
//  Coordinator
//
//  Created by José Valderrama on 11/09/2024.
//

import SwiftUI

class CoordinatorViewModel: Coordinator {
    @Published var path: [Route]
    @Published var current: Route?
    
    init(path: [Route]) {
        self.path = path
    }
}

class CoordinatorAViewModel: Coordinator {
    @Published var path: [Route]
    @Published var current: Route?
    
    init(path: [Route]) {
        self.path = path
    }
}

struct CoordinatorView<Content>: View where Content: View {
    @StateObject var viewModel = CoordinatorViewModel(path: .init())
    var content: Content
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            content(transition: viewModel.current?.transition)
                .navigationDestination(for: Route.self, destination: \.destination.view)
        }
        .environmentObject(viewModel)
    }
    
    @ViewBuilder
    func content(transition: Route.Transition?) -> some View {
        switch transition {
        case .sheet:
            content
                .sheet(item: $viewModel.current, content: \.destination.view)
        case .cover:
            content
                .fullScreenCover(item: $viewModel.current, content: \.destination.view)
        default:
            content
        }
    }
}

