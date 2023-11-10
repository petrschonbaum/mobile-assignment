//
//  DetailViewContent.swift
//  Rockets
//
//  Created by Petr Schönbaum on 06.11.2023.
//

import SwiftUI
import Foundation

struct DetailViewContent {
    let name: String
    let description: String
    let parameters: [ParameterViewContent]
    let first: [StageViewContent]
    let second: [StageViewContent]
    let gallery: GalleryViewContent
}

extension DetailViewContent {
    static var mock: DetailViewContent {
        .init(
            name: "Falcon 9",
            description: "Falcon 1 is a two-stage rocket designed and manufactured by Space X",
            parameters: [
                .init(title: "90m", subtitle: "height"),
                .init(title: "40m", subtitle: "diameter"),
                .init(title: "500t", subtitle: "mass")
            ],
            first: [
                .init(image: Style.images.reusable, title: "reusable"),
                .init(image: Style.images.engine, title: "9 engines")
            ],
            second: [
                .init(image: Style.images.reusable, title: "reusable"),
                .init(image: Style.images.engine, title: "1 engine")
            ],
            gallery: .init(
                images: []
            )
        )
    }
}
