//
//  WalkthroughViewController-SetupWalkthroughViewControllers.swift
//  PTHub
//
//  Created by Alex Marchant on 20/10/2020.
//  Copyright © 2020 Alex Marchant. All rights reserved.
//

import Foundation

extension WalkthroughViewController {
    
    internal func setupWalkthroughViewControllers() {
        let trackWorkoutsVc = WalkthroughPageViewController.instantiate(storyboard: "WalkthroughPage")
        
        trackWorkoutsVc.setupScreenInformation(
            imageName: "",
            stepTitle: "Track Your Workouts",
            stepDescription: "Every workout you perform is tracked in the app.\n\nYou can see your workout history by going to the 'Track' tab to find out how many workouts you performed on a particular day, so you can keep on track (pardon the pun).",
            delegate: self)
        
        let stagesAndLevelsVc = WalkthroughPageViewController.instantiate(storyboard: "WalkthroughPage")
        
        stagesAndLevelsVc.setupScreenInformation(
            imageName: "",
            stepTitle: "Stages & Levels",
            stepDescription: "The Kegel Trainer app comes with pre-existing stages and levels that you can complete to increase your strength. These start from easy and get progressively harder.\n\nTo complete a level, tap the level you want to attempt and follow the instructions from there. Once you complete a level, the next level is unlocked.\n\nYou must complete all the levels in a stage so that you can unlock the next stage.",
            delegate: self)
        
        let performWorkoutsVc = WalkthroughPageViewController.instantiate(storyboard: "WalkthroughPage")
        
        performWorkoutsVc.setupScreenInformation(
            imageName: "",
            stepTitle: "Performing Workouts",
            stepDescription: "To perform a workout, you can go to the 'Timer' tab; this is where you can begin a workout.\n\nThe rep count, rep length and reps left for the current workout will be shown to you.",
            delegate: self)
        
        let remindersVc = WalkthroughPageViewController.instantiate(storyboard: "WalkthroughPage")
        
        remindersVc.setupScreenInformation(
            imageName: "",
            stepTitle: "Setting Up Reminders",
            stepDescription: "If you want to keep yourself on track, you can add custom reminders at a specific time containing a message. These will be sent to you as notifications at the time you decide.\n\nYou can go to the 'Reminders' tab to manage all these reminders, including adding, editing and deleting existing ones.",
            delegate: self)
        
        let settingsVc = WalkthroughPageViewController.instantiate(storyboard: "WalkthroughPage")
        
        settingsVc.setupScreenInformation(
            imageName: "",
            stepTitle: "Set Your Settings",
            stepDescription: "To create a completely custom workout, update your workout preferences, contact support and more, you can go to the settings tab.",
            buttonText: "End Walkthrough",
            delegate: self)
        
        orderedWalkthroughSteps = [trackWorkoutsVc, stagesAndLevelsVc, performWorkoutsVc, remindersVc, settingsVc]
    }
    
}
