//
//  AppDelegate.swift
//  PhimosisStretches
//
//  Created by Alex Marchant on 12/05/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import UIKit
import GoogleMobileAds

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window : UIWindow?
    private var appCoordinator: AppCoordinator!
    
    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey : Any]?)
        -> Bool {
            if #available(iOS 13, *) {
                // do only pure app launch stuff, not interface stuff
            } else {
                self.window = UIWindow()
                
                let navigationController = UINavigationController()
                
                self.appCoordinator = AppCoordinator(navigationController: navigationController)
                self.appCoordinator.start()
                
                self.window?.rootViewController = navigationController
                self.window?.makeKeyAndVisible()
                
                RequestReview.requestReview()
                
                let launchedBefore = UserDefaults.standard.bool(forKey: Constants.launchedBefore)
                
                if (launchedBefore == false) {
                    self.appCoordinator.showWalkthroughOnStartup()
                    UserDefaults.standard.set(true, forKey: Constants.launchedBefore)
                }
            }

            GADMobileAds.sharedInstance().start(completionHandler: nil)
            
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound])
            { (granted, error) in
                
            }
            
            return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }


}

