//
//  OBStepTwoLocalDataManager.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation

class OBStepTwoLocalDataManager:OBStepTwoLocalDataManagerInputProtocol {
    
    var localRequestHandler: OBStepTwoLocalDataManagerOutputProtocol?
    
    func saveRange(range: Int) {
        UserDefaults.standard.set(range, forKey: UserPreferences.RangeKey)
    }
}
