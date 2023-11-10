//
//  RocketListViewContent.swift
//  Rockets
//
//  Created by Petr Schönbaum on 06.11.2023.
//

import Foundation

struct RocketListViewContent: Identifiable {
    let id: String
    let name: String
    let firstFlight: String

    var firstFlightFormatted: String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        guard let date = formatter.date(from: firstFlight) else { return nil }

        formatter.dateFormat = "dd.MM.yyyy"

        let formatted = formatter.string(from: date)

        return String(format: Localization.list.firstFlight, formatted)
    }
}

extension RocketListViewContent {
    static var mock: RocketListViewContent {
        .init(
            id: "1",
            name: "Falcon 9",
            firstFlight: "12.1.2020"
        )
    }
}
