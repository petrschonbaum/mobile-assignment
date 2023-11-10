//
//  ParameterView.swift
//  Rockets
//
//  Created by Petr Schönbaum on 06.11.2023.
//

import SwiftUI

struct ParameterView: View {

    let content: ParameterViewContent

    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Text(content.title)
                    .font(.title.bold())
                    .minimumScaleFactor(0.5)
                Text(content.subtitle)
                    .font(.subheadline)
                Spacer()
            }
            Spacer()
        }
        .padding()
        .foregroundStyle(.white)
        .background(Style.colors.pinkPrimary)
        .cornerRadius(15)
        .aspectRatio(1, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ParameterView(
        content: .init(
            title: "90m",
            subtitle: "height"
        )
    )
}
