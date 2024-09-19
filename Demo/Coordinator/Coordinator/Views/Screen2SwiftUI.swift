//
//  Screen2SwiftUI.swift
//  Coordinator
//
//  Created by José Valderrama on 11/09/2024.
//

import SwiftUI

struct Screen2SwiftUI: View {
    let message: String
    
    var body: some View {
        Text(message)
    }
}

#Preview {
    Screen2SwiftUI(message: "a text")
}
