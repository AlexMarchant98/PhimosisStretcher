//
//  TimerServiceProtocol.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 13/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

protocol TimerServiceProtocol {
    func start(delayTime: TimeInterval)
    func pause()
    func resume()
}
