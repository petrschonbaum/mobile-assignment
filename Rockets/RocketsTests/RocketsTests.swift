//
//  RocketsTests.swift
//  RocketsTests
//
//  Created by Petr Schönbaum on 05.11.2023.
//

import XCTest
@testable import Rockets

final class RocketsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_rocket_launch_when_accelerometer_treshold_exceeded() {
        let expectation = expectation(description: "Publisher completed!")
        let mockMotionTracking = MockMotionTracking(
            expectation: expectation,
            accelerometerData: [0.1, 0.5, 1.3, 1.0]
        )
        let launchViewModel = LaunchViewModel(motionTracking: mockMotionTracking)

        waitForExpectations(timeout: 3)

        XCTAssert(launchViewModel.launch)
    }

    func test_rocket_launch_when_accelerometer_treshold_not_exceeded() {
        let expectation = expectation(description: "Publisher completed!")
        let mockMotionTracking = MockMotionTracking(
            expectation: expectation,
            accelerometerData: [0.1, 0.5, 1.2, 1.0]
        )
        let launchViewModel = LaunchViewModel(motionTracking: mockMotionTracking)

        waitForExpectations(timeout: 3)

        XCTAssertFalse(launchViewModel.launch)
    }

    func test_rocket_launch_when_gyro_treshold_exceeded() {
        let expectation = expectation(description: "Publisher completed!")
        let mockMotionTracking = MockMotionTracking(
            expectation: expectation,
            gyroData: [0.1, 0.5, 0.9, 1.2]
        )
        let launchViewModel = LaunchViewModel(motionTracking: mockMotionTracking)

        waitForExpectations(timeout: 3)

        XCTAssert(launchViewModel.launch)
    }

    func test_rocket_launch_when_gyro_treshold_not_exceeded() {
        let expectation = expectation(description: "Publisher completed!")
        let mockMotionTracking = MockMotionTracking(
            expectation: expectation,
            gyroData: [0.1, 0.5, 0.9, 1.0]
        )
        let launchViewModel = LaunchViewModel(motionTracking: mockMotionTracking)

        waitForExpectations(timeout: 3)

        XCTAssertFalse(launchViewModel.launch)
    }


    func test_check_accelerometer_data_returns_true_when_treshold_exceeded() {
        let mockMotionTracking = MockMotionTracking()
        let launchViewModel = LaunchViewModel(motionTracking: mockMotionTracking)

        let result = launchViewModel.checkAccelerometerData(10)

        XCTAssert(result)
    }


    func test_check_accelerometer_data_returns_fasle_when_treshold_not_exceeded() {
        let mockMotionTracking = MockMotionTracking()
        let launchViewModel = LaunchViewModel(motionTracking: mockMotionTracking)

        let result = launchViewModel.checkAccelerometerData(0)

        XCTAssertFalse(result)
    }

    func test_check_accelerometer_data_returns_false_when_value_is_nil() {
        let mockMotionTracking = MockMotionTracking()
        let launchViewModel = LaunchViewModel(motionTracking: mockMotionTracking)

        let result = launchViewModel.checkAccelerometerData(nil)

        XCTAssertFalse(result)
    }

    func test_check_gyro_data_returns_true_when_treshold_exceeded() {
        let mockMotionTracking = MockMotionTracking()
        let launchViewModel = LaunchViewModel(motionTracking: mockMotionTracking)

        let result = launchViewModel.checkAccelerometerData(10)

        XCTAssert(result)
    }

    func test_check_gyro_data_returns_fasle_when_treshold_not_exceeded() {
        let mockMotionTracking = MockMotionTracking()
        let launchViewModel = LaunchViewModel(motionTracking: mockMotionTracking)

        let result = launchViewModel.checkGyroData(0)

        XCTAssertFalse(result)
    }

    func test_check_gyro_data_returns_false_when_value_is_nil() {
        let mockMotionTracking = MockMotionTracking()
        let launchViewModel = LaunchViewModel(motionTracking: mockMotionTracking)

        let result = launchViewModel.checkGyroData(nil)

        XCTAssertFalse(result)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
