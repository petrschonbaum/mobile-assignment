//
//  RocketApp+Assembly.swift
//  Rockets
//
//  Created by Petr Schönbaum on 05.11.2023.
//

import CoreMotion
import Swinject

extension RocketsApp {
    static func assembly(_ container: Container) {
        // Networking
        container.register(NetworkingServiceType.self) { _ in
            NetworkingService()
        }.inObjectScope(.transient)

        //ViewModels
        container.register(ListViewModel.self) { resolver in
            ListViewModel(
                networkingService: resolver.forceResolve(NetworkingServiceType.self),
                resolver: resolver
            )
        }.inObjectScope(.transient)

        container.register(DetailViewModel.self) { resolver, rocket in
            DetailViewModel(rocket: rocket, resolver: resolver)
        }.inObjectScope(.transient)

        container.register(LaunchViewModel.self) { resolver in
            LaunchViewModel(
                motionTracking: resolver.forceResolve(MotionTracking.self)
            )
        }

        container.register(MotionTracking.self) { _ in
            LiveMotionTracking()
        }
    }
}
