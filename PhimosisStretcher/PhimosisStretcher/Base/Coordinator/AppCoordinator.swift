//
//  AppCoordinator.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    let alertHandlerService: AlertHandlerServiceProtocol
    let userDefaultsService: UserDefaultsServiceProtocol
    
    var stretchesCoordinator: StretchesCoordinator!
    var workoutCoordinator: WorkoutCoordinator!
    var settingsCoordinator: SettingsCoordinator!

    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
        
        self.alertHandlerService = AlertHandlerService()
        self.userDefaultsService = UserDefaultsService()
        
        super.init()
        
        self.stretchesCoordinator = StretchesCoordinator(
            alertHandlerService,
            userDefaultsService,
            delegate: self)
        
        self.workoutCoordinator = WorkoutCoordinator(
            alertHandlerService,
            userDefaultsService,
            delegate: self)
        
        self.settingsCoordinator = SettingsCoordinator(
            alertHandlerService,
            userDefaultsService,
            delegate: self)
    }

    // MARK: - Start
    
    override func start() {
        
        let tabBarController = UITabBarController()
        
        stretchesCoordinator.start()
        workoutCoordinator.start()
        settingsCoordinator.start()
        
        tabBarController.viewControllers = [
            stretchesCoordinator.navigationController,
            workoutCoordinator.navigationController,
            settingsCoordinator.navigationController
        ]
        
        self.navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: StretchesCoordinatorDelegate {
    
}

extension AppCoordinator: WorkoutCoordinatorDelegate {
    
}

extension AppCoordinator: SettingsCoordinatorDelegate {
    
}
