//
//  StretchesPresenterProtocol.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol StretchesPresenterProtocol: AdvertScreenPresenterProtocol {
    func didSelectStretch(_ selectedStretch: StretchInfo)
    func didSelectUnderstandingPhimosis(_ understandingPhimosis: UnderstandingPhimosis)
    func didSelectSafetyMeasures(_ safetyMeasures: SafetyMeasures)
}
