//
//  Resolver+Force.swift
//  Rockets
//
//  Created by Petr Schönbaum on 05.11.2023.
//

import Foundation
import Swinject

public extension Resolver {
    func forceResolve<Service>(_ serviceType: Service.Type, name: String? = nil) -> Service {
        resolve(serviceType, name: name)! // swiftlint:disable:this force_unwrapping
    }

    func forceResolve<Service, Arg1>(_ serviceType: Service.Type, name: String? = nil, argument: Arg1) -> Service {
        resolve(serviceType, name: name, argument: argument)! // swiftlint:disable:this force_unwrapping
    }
}
