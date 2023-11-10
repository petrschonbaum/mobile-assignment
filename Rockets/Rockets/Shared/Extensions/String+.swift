//
//  String+.swift
//  Rockets
//
//  Created by Petr Schönbaum on 09.11.2023.
//

public extension String {
    var localized: String {
        String(localized: LocalizationValue(self))
    }
}
