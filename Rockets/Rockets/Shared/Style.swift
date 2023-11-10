//
//  Style.swift
//  Rockets
//
//  Created by Petr Schönbaum on 09.11.2023.
//

import SwiftUI

struct Style {
    static let colors = Colors()
    static let images = Images()
}

extension Style {
    struct Colors {
        let grayBg = Color("gray_bg")
        let pinkPrimary = Color("pink_primary")
    }

    struct Images {
        let engine = Image("engine")
        let reusable = Image("reusable")
        let fuel = Image("fuel")
        let burn = Image("burn")
        let chevronRight = Image(systemName: "chevron.right")
        let rocket = Image("rocket")
        let flying = Image("flying")
        let idle = Image("idle")

        func rocket(_ launch: Bool) -> Image {
            launch ? flying : idle
        }
    }
}
