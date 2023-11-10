//
//  LaunchViewModel.swift
//  Rockets
//
//  Created by Petr Schönbaum on 06.11.2023.
//

import Combine
import CoreMotion
import SwiftUI

@Observable
final class LaunchViewModel {

    let motionTracking: MotionTracking

    var launch: Bool = false

    private var cancellables = Set<AnyCancellable>()

    init(motionTracking: MotionTracking) {
        self.motionTracking = motionTracking
        bind()
        motionTracking.start()
    }

    func checkAccelerometerData(_ value: Double?) -> Bool {
        guard let value else { return false }
        return abs(value) > 1.2
    }

    func checkGyroData(_ value: Double?) -> Bool {
        guard let value else { return false }
        return value > 1
    }
}

extension LaunchViewModel {
    func bind() {
        motionTracking
            .accelerometerUpdatesPublisher
            .sink { [weak self] value in
                guard let self, !launch else { return }
                self.launch = checkAccelerometerData(value)
            }
            .store(in: &cancellables)


        motionTracking
            .gyroUpdatesPublisher
            .sink { [weak self] value in
                guard let self, !launch else { return }
                self.launch = checkGyroData(value)
            }
            .store(in: &cancellables)
    }
}
