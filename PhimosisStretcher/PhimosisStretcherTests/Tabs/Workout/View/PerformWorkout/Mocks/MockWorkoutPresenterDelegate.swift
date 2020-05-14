//
//  MockWorkoutPresenterDelegate.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockWorkoutPresenterDelegate: MockObjectProtocol, WorkoutPresenterDelegate {
    
    var didCompleteWorkoutCallCount = 0
    
    func resetCallCounts() {
        self.didCompleteWorkoutCallCount = 0
    }
    
    func didCompleteWorkout() {
        didCompleteWorkoutCallCount += 1
    }
}