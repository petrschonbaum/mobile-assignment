//
//  PrimaryButtonStyle.swift
//  Rockets
//
//  Created by Petr Schönbaum on 07.11.2023.
//

import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
    private struct Style {
        static let font: Font = .body
        static let tintColor = Color.white
        static let backgroundColor = Color("pink")
        static let disabledBackgroundColor = Color("gray")
    }

    @Environment(\.isEnabled) var isEnabled

    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        let backgroundColor: Color
        if !isEnabled {
            backgroundColor = Style.disabledBackgroundColor
        } else {
            backgroundColor = Style.backgroundColor
        }

        return configuration.label
            .frame(maxWidth: .infinity, minHeight: 45)
            .font(Style.font)
            .lineLimit(1)
            .foregroundColor(Style.tintColor)
            .background(backgroundColor)
            .clipShape(Capsule())
    }
}

public extension ButtonStyle where Self == PrimaryButtonStyle {
    static var primary: PrimaryButtonStyle {
        PrimaryButtonStyle()
    }
}
