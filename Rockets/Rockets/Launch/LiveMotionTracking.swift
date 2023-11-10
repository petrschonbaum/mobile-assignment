//
//  LiveMotionTracking.swift
//  Rockets
//
//  Created by Petr Schönbaum on 09.11.2023.
//

import Combine
import CoreMotion

protocol MotionTracking {
    var accelerometerUpdatesPublisher: AnyPublisher<Double?, Never> { get }
    var gyroUpdatesPublisher: AnyPublisher<Double?, Never> { get }
    func start() -> Void
}

final class LiveMotionTracking: MotionTracking {
    var accelerometerUpdatesPublisher: AnyPublisher<Double?, Never> {
        accelerometerUpdatesSubject
            .eraseToAnyPublisher()
    }
    var gyroUpdatesPublisher: AnyPublisher<Double?, Never> {
        gyroUpdatesSubject
            .eraseToAnyPublisher()
    }

    private let accelerometerUpdatesSubject = PassthroughSubject<Double?, Never>()
    private let gyroUpdatesSubject = PassthroughSubject<Double?, Never>()
    private let motionManager: CMMotionManager

    init() {
        motionManager = CMMotionManager()
    }

    func start() {
        guard motionManager.isGyroAvailable && motionManager.isAccelerometerAvailable else { return }

        motionManager.gyroUpdateInterval = 0.1
        motionManager.accelerometerUpdateInterval = 0.1

        motionManager.startAccelerometerUpdates(to: .main) { [weak self] data, _ in
            self?.accelerometerUpdatesSubject.send(data?.acceleration.z)
        }

        motionManager.startGyroUpdates(to: .main) { [weak self] data, _ in
            self?.gyroUpdatesSubject.send(data?.rotationRate.x)
        }
    }
}
