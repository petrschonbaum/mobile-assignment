//
//  StageView.swift
//  Rockets
//
//  Created by Petr Schönbaum on 06.11.2023.
//

import SwiftUI

struct StageView: View {

    let title: String
    let content: [StageViewContent]

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.body.bold())
            ForEach(content) { item in
                HStack {
                    item.image
                    Text(item.title)
                    Spacer()
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Style.colors.grayBg)
        .cornerRadius(15)
    }
}

#Preview {
    StageView(
        title: "First stage",
        content: DetailViewContent.mock.first
    )
}
