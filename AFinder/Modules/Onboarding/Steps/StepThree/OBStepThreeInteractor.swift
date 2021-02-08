//
//  OBStepThreeInteractor.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation

class OBStepThreeInteractor: OBStepThreeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: OBStepThreeInteractorOutputProtocol?
    var localDatamanager: OBStepThreeLocalDataManagerInputProtocol?
    var remoteDatamanager: OBStepThreeRemoteDataManagerInputProtocol?
    
    func doneButtonAction(){
        self.localDatamanager?.disableOnboarding()
    }

}

extension OBStepThreeInteractor: OBStepThreeRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
