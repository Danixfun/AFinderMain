//
//  MapLocalDataManager.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation

class MapLocalDataManager:MapLocalDataManagerInputProtocol {
    
    var localRequestHandler: MapLocalDataManagerOutputProtocol?
    
    func getRange() -> Int {
        if let range = UserDefaults.standard.value(forKey: UserPreferences.RangeKey) as? Int{
            return range
        }
        return RadiusRangeValues.defaultValue//Default value to prevent errors
    }
}
