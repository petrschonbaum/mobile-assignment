//
//  ListViewModel.swift
//  Rockets
//
//  Created by Petr Schönbaum on 05.11.2023.
//

import SwiftUI
import SwiftUINavigation
import Swinject

@Observable
final class ListViewModel {
    var destination: Destination?

    enum Destination: Equatable {
        case detail(RocketModel)
    }

    var rockets: [RocketModel] = []

    var state: ListViewModelState = .loading

    let networkingService: NetworkingServiceType

    private let resolver: Resolver

    init(networkingService: NetworkingServiceType, resolver: Resolver) {
        self.networkingService = networkingService
        self.resolver = resolver
        load()
    }

    func load() {
        state = .loading
        Task(priority: .background) {
            do {
                let result = try await fetchRockets()
                rockets = result ?? []
                let content = self.rockets.map { self.map(model: $0) }
                self.state = .loaded(content)
            }
            catch {
                self.state = .error
            }
        }
    }

    func resolveDetailViewModel(rocket: RocketModel) -> DetailViewModel {
        resolver.forceResolve(DetailViewModel.self, argument: rocket)
    }
}

private extension ListViewModel {

    func fetchRockets() async throws -> [RocketModel]? {
        try await networkingService.sendRequest(
            endpoint: ListEndpoint(),
            urlParams: nil,
            body: nil
        )
    }

    func map(model: RocketModel) -> RocketListViewContent {
        .init(
            id: model.id,
            name: model.name,
            firstFlight: model.firstFlight
        )
    }
}

extension ListViewModel {
    func showDetail(with id: String) {
        guard let model = rockets.first(where: { $0.id == id }) else { return }
        destination = .detail(model)
    }
}
