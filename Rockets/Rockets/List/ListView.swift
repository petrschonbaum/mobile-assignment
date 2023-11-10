//
//  ListView.swift
//  Rockets
//
//  Created by Petr Schönbaum on 05.11.2023.
//

import SwiftUI
import SwiftUINavigation
import Swinject

struct ListView: View {
    @State var viewModel: ListViewModel

    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .loaded(let content):
                loadedView(content)
            case .error:
                errorView
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(Localization.list.title)
        .navigationDestination(
            unwrapping: $viewModel.destination,
            case: /ListViewModel.Destination.detail
        ) { $rocket in
            DetailView(
                viewModel: viewModel.resolveDetailViewModel(rocket: rocket)
            )
        }

    }
}

private extension ListView {
    func loadedView(_ content: [RocketListViewContent]) -> some View {
        List {
            ForEach(content) { rocket in
                RocketListView(rocket: rocket) {
                    viewModel.showDetail(with: rocket.id)
                }
            }
        }
    }

    var errorView: some View {
        VStack(alignment: .center) {
            Text(Localization.list.error)
                .font(.body)
                .padding(.bottom, 15)
            Button(Localization.list.tryAgain) {
                viewModel.load()
            }
            .buttonStyle(.primary)
        }
        .padding(.horizontal, 25)
    }
}
