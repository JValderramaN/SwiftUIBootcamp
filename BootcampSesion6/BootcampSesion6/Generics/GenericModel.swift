//
//  GenericModel.swift
//  BootcampSesion6
//
//  Created by José Valderrama on 17/10/2024.
//

import Foundation

class Stack<Element> {
    private (set) var items: [Element] = []

    func push(_ item: Element) {
        items.append(item)
    }

    func pop() -> Element? {
        return items.popLast()
    }
}

struct NumeroStruct: CustomStringConvertible {
    let value: Int
    var description: String { "\(value)"}
}
