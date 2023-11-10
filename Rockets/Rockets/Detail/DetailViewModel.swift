//
//  DetailViewModel.swift
//  Rockets
//
//  Created by Petr Schönbaum on 05.11.2023.
//

import SwiftUI
import SwiftUINavigation
import Swinject

@Observable
final class DetailViewModel {
    var destination: Destination?

    enum Destination: Equatable {
        case launch
    }

    private var rocket: RocketModel

    let content: DetailViewContent

    private let resolver: Resolver

    init(rocket: RocketModel, resolver: Resolver) {
        self.rocket = rocket
        self.resolver = resolver
        self.content = DetailViewModel.map(rocket)
    }

    func resolveLaunchViewModel() -> LaunchViewModel {
        resolver.forceResolve(LaunchViewModel.self)
    }
}

private extension DetailViewModel {
    static func map(_ rocket: RocketModel) -> DetailViewContent {
        .init(
            name: rocket.name,
            description: rocket.description,
            parameters: mapParameters(rocket: rocket),
            first: mapStage(stage: rocket.firstStage),
            second: mapStage(stage: rocket.secondStage),
            gallery: mapPhotos(images: rocket.images)
        )
    }

    static func mapPhotos(images: [String]) -> GalleryViewContent {
        let urls = images.compactMap {
            URL(string: $0)
        }

        return .init(
            images: urls.map { .init(url: $0) }
        )
    }

    static func mapParameters(rocket: RocketModel) -> [ParameterViewContent] {
        [
            .init(title: "\(rocket.height.value)m", subtitle: Localization.detail.height),
            .init(title: "\(rocket.diameter.value)m", subtitle: Localization.detail.diameter),
            .init(title: "\(rocket.mass.value)t", subtitle: Localization.detail.mass)
        ]
    }

    static func mapStage(stage: Stage) -> [StageViewContent] {
        [
            .init(
                image: Style.images.reusable,
                title: stage.reusable ? Localization.detail.reusable : Localization.detail.notReusable
            ),
            .init(
                image: Style.images.engine,
                title: formatEngines(count: stage.engines)
            ),
            .init(
                image: Style.images.fuel,
                title: "\(stage.fuelAmount) \(Localization.detail.fuel)"
            ),
            .init(
                image: Style.images.burn,
                title: formatBurnTime(count: stage.burnTime ?? 0)
            )
        ]
    }

    static func formatEngines(count: Int) -> String {
        switch count {
        case 1:
            return "\(count) \(Localization.detail.engine)"
        default:
            return "\(count) \(Localization.detail.engines)"
        }
    }

    static func formatBurnTime(count: Int) -> String {
        switch count {
        case 1:
            return "\(count) \(Localization.detail.second)"
        default:
            return "\(count) \(Localization.detail.seconds)"
        }
    }
}
