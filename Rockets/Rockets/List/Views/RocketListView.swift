//
//  RocketListView.swift
//  Rockets
//
//  Created by Petr Schönbaum on 05.11.2023.
//

import SwiftUI

struct RocketListView: View {
    let rocket: RocketListViewContent
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            HStack(alignment: .center) {
                Style.images.rocket
                VStack(alignment: .leading) {
                    Text(rocket.name)
                        .font(.headline)
                        .foregroundStyle(.black)
                    
                    if let firstFlight = rocket.firstFlightFormatted {
                        Text(firstFlight)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                }
                Spacer()
                Style.images.chevronRight
                    .font(.body)
                    .foregroundStyle(.gray)
            }
        })
    }
}

#Preview {
    RocketListView(
        rocket: .mock
    ) {}
}
