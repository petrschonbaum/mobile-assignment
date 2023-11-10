//
//  ParameterViewContent.swift
//  Rockets
//
//  Created by Petr Schönbaum on 06.11.2023.
//

struct ParameterViewContent: Identifiable {

    var id: String {
        subtitle
    }

    let title: String
    let subtitle: String
}
