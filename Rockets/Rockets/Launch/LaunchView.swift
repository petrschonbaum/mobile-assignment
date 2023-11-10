//
//  LaunchView.swift
//  Rockets
//
//  Created by Petr Schönbaum on 06.11.2023.
//

import SwiftUI

struct LaunchView: View {
    @State var viewModel: LaunchViewModel
    @State var offset: CGFloat = -10

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Spacer()
                Style.images.rocket(viewModel.launch)
                    .padding(.bottom, 10)
                    .offset(y: offset)
                    .onChange(of: viewModel.launch) { oldValue, newValue in
                        withAnimation {
                            offset = -2 * (geometry.size.height / 3) + 80
                        }
                    }
                Text(viewModel.launch ? Localization.launch.afterLaunch : Localization.launch.beforeLaunch)
                    .padding(.bottom, 80)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .navigationTitle(Localization.launch.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
