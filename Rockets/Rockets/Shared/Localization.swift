//
//  Localization.swift
//  Rockets
//
//  Created by Petr Schönbaum on 09.11.2023.
//

struct Localization {
    static let list = List()
    static let detail = Detail()
    static let launch = Launch()
}

extension Localization {
    struct List {
        let title = "list_title".localized
        let error = "error".localized
        let tryAgain = "try_again".localized
        let firstFlight = "first_flight".localized
    }

    struct Detail {
        let photos = "photos".localized
        let firstStage = "first_stage".localized
        let secondStage = "second_stage".localized
        let launch = "launch".localized
        let overview = "overview".localized
        let parameters = "parameters".localized
        let height = "height".localized
        let diameter = "diameter".localized
        let mass = "mass".localized
        let reusable = "reusable".localized
        let notReusable = "not_reusable".localized
        let fuel = "fuel".localized
        let engine = "engine".localized
        let engines = "engines".localized
        let second = "second".localized
        let seconds = "seconds".localized
    }

    struct Launch {
        let title = "launch".localized
        let afterLaunch = "after_launch".localized
        let beforeLaunch = "before_launch".localized
    }
}
