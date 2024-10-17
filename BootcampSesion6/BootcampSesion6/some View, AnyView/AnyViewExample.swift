//
//  AnyViewExample.swift
//  BootcampSesion6
//
//  Created by José Valderrama on 17/10/2024.
//

import SwiftUI

func anyViewExample(flag: Bool) -> AnyView {
    if flag {
        return AnyView(Text("Verdadero"))
    } else {
        return AnyView(Image(systemName: "xmark"))
    }
}
