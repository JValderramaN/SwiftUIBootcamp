//
//  DateExtension.swift
//  BootcampSesion7
//
//  Created by José Valderrama on 24/10/2024.
//

import Foundation

extension Date {
    var nowFormatted: String {
        let currentDate = Date.now
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        let isoDateString = isoFormatter.string(from: currentDate)
        return isoDateString
    }
}
