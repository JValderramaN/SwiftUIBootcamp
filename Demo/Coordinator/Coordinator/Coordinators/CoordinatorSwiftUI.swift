//
//  CoordinatorSwiftUI.swift
//  Coordinator
//
//  Created by José Valderrama on 11/09/2024.
//

import SwiftUI

protocol Coordinator: ObservableObject {
    var path: [Route] { get set }
    var current: Route? { get set }
    func process(routes: [Route])
    func process(action: Route.Action)
}

extension Coordinator {
    
    func process(routes: [Route]) {
        switch routes.last?.transition {
        case let .push(replace):
            var removed = false
            if replace {
                removed = self.removeOnwards(routes: routes)
            }
            
            if removed {
                path.append(contentsOf: routes)
            } else {
                path.append(contentsOf: routes)
            }
        default:
            current = routes.last
        }
    }
    
    func process(action: Route.Action) {
        switch action {
        case let .pop(count) where 0...path.count ~= count:
            path.removeLast(count)
        case .dismiss:
            current = nil
        case .popToRoot:
            path = .init()
            current = nil
        default:
            print("Coordinator found incorrect action (\(action)), path \(path)")
        }
    }
    
    private func removeOnwards(routes: [Route]) -> Bool {
        guard let first = routes.first,
              let index = path.firstIndex(of: first) else {
            return false
        }
        
        path.removeSubrange(index...)
        return true
    }
}

struct Route: Identifiable, Hashable {
    var id: String {
        destination.id
    }
    let destination: Destination
    let transition: Transition
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        lhs.id == rhs.id
    }
}

extension Route {
    enum Destination {
        case screen1
        case screen2(message: String)
        
        var id: String {
            switch self {
            case .screen1: return "screen1"
            case .screen2: return "screen2"
            }
        }
            
        @ViewBuilder
        var view: some View {
            switch self {
            case .screen1:
                Screen1SwiftUI()
            case let .screen2(message):
                Screen2SwiftUI(message: message)
            }
        }
    }
    
    enum Transition {
        case push(replacing: Bool), sheet, cover
    }
    
    enum Action {
        case pop(count: Int), popToRoot, dismiss
    }
}
