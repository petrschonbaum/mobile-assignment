//
//  RocketsApp.swift
//  Rockets
//
//  Created by Petr Schönbaum on 05.11.2023.
//

import SwiftUI
import Swinject

@main
struct RocketsApp: App {
    let container: Container = {
        let container = Container()
        assembly(container)
        return container
    }()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView(viewModel: container.forceResolve(ListViewModel.self))
            }
            .preferredColorScheme(.light)
        }

    }
}
