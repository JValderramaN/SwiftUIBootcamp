//
//  CeldaSwiftUI.swift
//  BootcampSesion3
//
//  Created by José Valderrama on 26/09/2024.
//

import SwiftUI

struct CeldaSwiftUI: View {
    let title: String
    var body: some View {
        ZStack {
            Color.indigo
            
            Text(title)
        }
    }
}

#Preview {
    CeldaSwiftUI(title: "preview")
}

