//
//  GalleryViewContent.swift
//  Rockets
//
//  Created by Petr Schönbaum on 06.11.2023.
//

import Foundation

struct GalleryViewContent {
    let images: [GalleryImage]
}

struct GalleryImage: Identifiable {

    var id: String {
        url.absoluteString
    }

    let url: URL
}
