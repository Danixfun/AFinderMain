//
//  OBStepThreeLocalDataManager.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation

class OBStepThreeLocalDataManager:OBStepThreeLocalDataManagerInputProtocol {
    
    var localRequestHandler: OBStepThreeLocalDataManagerOutputProtocol?
    
    func disableOnboarding() {
        UserDefaults.standard.set(false, forKey: UserPreferences.OnboardingAvailableKey)
    }
}
