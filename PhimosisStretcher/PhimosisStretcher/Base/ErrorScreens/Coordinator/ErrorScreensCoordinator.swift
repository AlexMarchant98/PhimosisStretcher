//
//  ErrorScreensCoordinator.swift
//  PhimosisStretcher
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit

protocol ErrorScreensCoordinatorDelegate {
}

extension ErrorScreensCoordinatorDelegate {
}

class ErrorScreensCoordinator: Coordinator {
    
    static let shared = ErrorScreensCoordinator()
    
    var delegate: ErrorScreensCoordinatorDelegate?
    var navigationController: UINavigationController!
    
    override init() { }
    
    override func start() {
        // Don't do anything
    }
    
    func showEnableNotifications() {
        DispatchQueue.main.sync {
            let viewController = EnableNotificationsViewController.instantiate(storyboard: "EnableNotifications")
            
            let enableNotificationsPresenter = EnableNotificationsPresenter(
                    with: viewController,
                    delegate: self)

            viewController.informationScreenPresenter = enableNotificationsPresenter
            viewController.enableNotificationsPresenter = enableNotificationsPresenter
            viewController.alertHandlerService = AlertHandlerService()
        
            self.navigationController.pushViewController(viewController, animated: true)
        }
    }
    
}

extension ErrorScreensCoordinator: InformationScreenPresenterDelegate {
    func didTapClose() {
        self.navigationController.popViewController(animated: true)
    }
}

extension ErrorScreensCoordinator: EnableNotificationsPresenterDelegate {
    func didComplete() {
        self.navigationController.popViewController(animated: true)
    }
}
