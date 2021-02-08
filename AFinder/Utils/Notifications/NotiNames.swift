//
//  NotiNames.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//

import Foundation


struct NotiNames {
    /// Tells OnbordingView to update its PageController to the next View
    static let nextOnboardingStep = NSNotification.Name("nextOnboardingStep")
    
    /// Tells OnboardingView that onboarding has been completed
    static let finishOnboarding = NSNotification.Name("finishOnboarding")
    
    /// Tells OnboardingView that onboarding has been canceled
    static let quitOnboarding = NSNotification.Name("quitOnboarding")
    
    /// Tells WelcomeView to open MapView
    static let openMapView = NSNotification.Name("openMapView")
    
    /// Tells MapView to update airports AKA a new network call
    static let updateMapWithNewRange = NSNotification.Name("updateMapWithNewRange")
}
