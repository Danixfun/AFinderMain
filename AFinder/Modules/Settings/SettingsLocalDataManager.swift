//
//  SettingsLocalDataManager.swift
//  AFinder
//
//  Created by Daniel Tejeda on 08/02/21.
//  
//

import Foundation

class SettingsLocalDataManager:SettingsLocalDataManagerInputProtocol {

    var localRequestHandler: SettingsLocalDataManagerOutputProtocol?
    
    func loadCurrentRange() {
        if let range = UserDefaults.standard.object(forKey: UserPreferences.RangeKey) as? Int {
            self.localRequestHandler?.currentRange(range: range)
        }
    }
    
    func saveNewRange(range: Float) {
        let rangeAsInt = Int(range)
        UserDefaults.standard.set(rangeAsInt, forKey: UserPreferences.RangeKey)
    }
}
