//
//  SafetyMeasures.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 20/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

struct SafetyMeasures: Decodable {
    var title: String
    var introduction: String
    var safetyTips: [SafetyTip]
    var image: String
    var references: [String]
}
