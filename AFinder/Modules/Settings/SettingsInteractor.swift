//
//  SettingsInteractor.swift
//  AFinder
//
//  Created by Daniel Tejeda on 08/02/21.
//  
//

import Foundation

class SettingsInteractor: SettingsInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: SettingsInteractorOutputProtocol?
    var localDatamanager: SettingsLocalDataManagerInputProtocol?
    var remoteDatamanager: SettingsRemoteDataManagerInputProtocol?
    
    func loadCurrentRange() {
        self.localDatamanager?.loadCurrentRange()
    }
    
    func updateRange(range: Float) {
        self.presenter?.newRangeString(rangeText: rangeAsString(range: Int(range)))
    }
    
    func saveNewRange(range: Float) {
        self.localDatamanager?.saveNewRange(range: range)
    }
    
    private func rangeAsString(range: Int)->String{
        if range == 1 {
            return "\(range) km"
        }
        return "\(range) kms"
    }
    
}

extension SettingsInteractor: SettingsRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    
}

extension SettingsInteractor: SettingsLocalDataManagerOutputProtocol {
    func currentRange(range: Int) {
        self.presenter?.currentRange(range: Float(range), rangeText: rangeAsString(range: range))
    }
}
