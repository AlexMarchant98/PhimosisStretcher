//
//  SettingsCoordinator.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit
import MessageUI

protocol SettingsCoordinatorDelegate {
    func showAppWalkthrough()
}

class SettingsCoordinator: Coordinator {
    
    let navigationController: UINavigationController
    
    let adServerService: AdServerServiceProtocol
    let alertHandlerService: AlertHandlerServiceProtocol
    let userDefaultsService: UserDefaultsServiceProtocol
    
    let delegate: SettingsCoordinatorDelegate
    
    init(
        _ adServerService: AdServerServiceProtocol,
        _ alertHandlerService: AlertHandlerServiceProtocol,
        _ userDefaultsService: UserDefaultsServiceProtocol,
        delegate: SettingsCoordinatorDelegate) {
        
        self.navigationController = UINavigationController()
        
        self.navigationController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings-icon"), tag: 0)
        
        self.adServerService = adServerService
        self.alertHandlerService = alertHandlerService
        self.userDefaultsService = userDefaultsService
        self.delegate = delegate
    }
    
    override func start() {
        self.showSettings()
    }
    
    func showSettings() {
        let settingsViewController = SettingsViewController.instantiate(storyboard: "Settings")
        
        let settingsPresenter = SettingsPresenter(
            adServerService,
            userDefaultsService,
            with: settingsViewController,
            delegate: self)
        
        settingsViewController.advertScreenPresenter = settingsPresenter
        settingsViewController.settingsPresenter = settingsPresenter
        settingsViewController.alertHandlerService = self.alertHandlerService
        
        navigationController.pushViewController(settingsViewController, animated: true)
    }
    
    func showReminders() {
        let remindersCoordinator = RemindersCoordinator(
            navigationController,
            alertHandlerService,
            delegate: self)
        
        self.addChildCoordinator(remindersCoordinator)
        
        remindersCoordinator.start()
    }
    
    func showEmail() {
        let vc = MFMailComposeViewController()
        
        vc.mailComposeDelegate = self
        
        vc.setToRecipients(["\(Constants.email)"])
        
        self.navigationController.present(vc, animated: true, completion: nil)
    }
    
    func showCredits() {
        let vc = CreditsViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
}

extension SettingsCoordinator: SettingsPresenterDelegate {
    func sendEmail() {
        showEmail()
    }
    
    func didSelectReminders() {
        showReminders()
    }
    
    func didSelectCredits() {
        showCredits()
    }
    
    func didSelectShowWalkthrough() {
        self.delegate.showAppWalkthrough()
    }
}

extension SettingsCoordinator: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}

extension SettingsCoordinator: RemindersCoordinatorDelegate {
}
