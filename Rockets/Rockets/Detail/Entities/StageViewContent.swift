//
//  StageViewContent.swift
//  Rockets
//
//  Created by Petr Schönbaum on 06.11.2023.
//

import SwiftUI

struct StageViewContent: Identifiable {

    var id: String {
        title
    }

    let image: Image
    let title: String
}
