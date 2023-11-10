//
//  DetailView.swift
//  Rockets
//
//  Created by Petr Schönbaum on 05.11.2023.
//

import SwiftUI
import SwiftUINavigation

struct DetailView: View {
    @State var viewModel: DetailViewModel

    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                info
                parameters
                StageView(title: Localization.detail.firstStage, content: viewModel.content.first)
                StageView(title: Localization.detail.secondStage, content: viewModel.content.second)
                GalleryView(content: viewModel.content.gallery)
            }
            .padding(15)
        }
        .navigationTitle(viewModel.content.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(Localization.detail.launch) {
                    viewModel.destination = .launch
                }
            }
        }

        .navigationDestination(
            unwrapping: $viewModel.destination,
            case: /DetailViewModel.Destination.launch
        ) { _ in
            LaunchView(
                viewModel: viewModel.resolveLaunchViewModel()
            )
        }
    }
}

extension DetailView {
    var info: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(Localization.detail.overview)
                .font(.body.bold())
            Text(viewModel.content.description)
        }
    }

    var parameters: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(Localization.detail.parameters)
                .font(.body.bold())
            LazyVGrid(columns: columns, content: {
                ForEach(viewModel.content.parameters) {
                    ParameterView(content: $0)
                }
            })
        }
    }
}
