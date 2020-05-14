//
//  MockWorkoutPresenter.swift
//  PhimosisStretcherTests
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
@testable import PhimosisStretcher

class MockWorkoutPresenter: MockObjectProtocol, WorkoutPresenterProtocol {
    
    var beginWorkoutCallCount = 0
    var resumeWorkoutCallCount = 0
    var pauseWorkoutCallCount = 0
    var closeWorkoutCallCount = 0
    
    func resetCallCounts() {
        self.beginWorkoutCallCount = 0
        self.resumeWorkoutCallCount = 0
        self.pauseWorkoutCallCount = 0
        self.closeWorkoutCallCount = 0
    }
    
    func beginWorkout() {
        beginWorkoutCallCount += 1
    }
    
    func resumeWorkout() {
        resumeWorkoutCallCount += 1
    }
    
    func pauseWorkout() {
        pauseWorkoutCallCount += 1
    }
    
    func closeWorkout() {
        closeWorkoutCallCount += 1
    }
}
