//
//  MockMotionTracking.swift
//  RocketsTests
//
//  Created by Petr Schönbaum on 09.11.2023.
//

import Combine
import Foundation
import CoreMotion
import XCTest
@testable import Rockets

final class MockMotionTracking: MotionTracking {
    var accelerometerUpdatesPublisher: AnyPublisher<Double?, Never> {
        accelerometerSubject
            .eraseToAnyPublisher()
    }

    var gyroUpdatesPublisher: AnyPublisher<Double?, Never> {
        gyroSubject
            .eraseToAnyPublisher()
    }

    private let accelerometerSubject = PassthroughSubject<Double?, Never>()
    private let gyroSubject = PassthroughSubject<Double?, Never>()
    private var cancellables = Set<AnyCancellable>()
    private var expectation: XCTestExpectation?
    private var accelerometerData: [Double]?
    private var gyroData: [Double]?

    init(expectation: XCTestExpectation? = nil, accelerometerData: [Double]? = nil, gyroData: [Double]? = nil) {
        self.expectation = expectation
        self.accelerometerData = accelerometerData
        self.gyroData = gyroData
    }

    func start() {
        accelerometerData?.publisher
            .eraseToAnyPublisher()
            .sink(
                receiveCompletion: { [weak self] _ in
                    self?.expectation?.fulfill()
                }, receiveValue: { [weak self] in
                    guard let self else { return }
                    self.accelerometerSubject.send($0)
                })
            .store(in: &cancellables)

        gyroData?.publisher
            .eraseToAnyPublisher()
            .sink(
                receiveCompletion: { [weak self] _ in
                    self?.expectation?.fulfill()
                }, receiveValue: { [weak self] in
                    guard let self else { return }
                    self.gyroSubject.send($0)
                })
            .store(in: &cancellables)
    }
}

