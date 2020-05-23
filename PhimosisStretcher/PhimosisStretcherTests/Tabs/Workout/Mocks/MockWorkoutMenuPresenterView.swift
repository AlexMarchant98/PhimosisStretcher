//
//  MockWorkoutMenuPresenterView.swift
//  PhimosisStretchesTests
//
//  Created by Alex Marchant on 15/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import GoogleMobileAds
@testable import PhimosisStretcher

class MockWorkoutMenuPresenterView: MockObjectProtocol, WorkoutMenuPresenterView {
    
    var didGetWorkoutInformationCallCount = 0
    var didGetBannerAdCallCount = 0
    var didGetInterstitialAdCallCount = 0
    
    func resetCallCounts() {
        self.didGetWorkoutInformationCallCount = 0
        self.didGetBannerAdCallCount = 0
        self.didGetInterstitialAdCallCount = 0
    }
    
    func didGetWorkoutInformation(_ numberOfWorkoutsToday: Int, _ targetWorkoutsPerDay: Int, _ workoutTime: String) {
        didGetWorkoutInformationCallCount += 1
    }
    
    func didGetBannerAd(ad: GADBannerView?) {
        didGetBannerAdCallCount += 1
    }
    
    func didGetInterstitialAd(ad: GADInterstitial?) {
        didGetInterstitialAdCallCount += 1
    }
}
