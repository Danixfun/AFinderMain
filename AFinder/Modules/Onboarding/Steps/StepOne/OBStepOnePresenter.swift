//
//  OBStepOnePresenter.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation

class OBStepOnePresenter  {
    
    // MARK: Properties
    weak var view: OBStepOneViewProtocol?
    var interactor: OBStepOneInteractorInputProtocol?
    var wireFrame: OBStepOneWireFrameProtocol?
    var once: Bool = false
    
}

extension OBStepOnePresenter: OBStepOnePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        self.view?.setUpLabels()
        self.view?.setUpButtons()
    }
    
    func viewDidLayoutSubviews() {
        if !once {
            once = true
            self.view?.setUpAnimation()
        }
    }
    
    func requestGPSPermission() {
        self.interactor?.requestGPSPermission()
    }
    
    func nextStep() {
        self.wireFrame?.nextStep()
    }
    
    func backButtonAction() {
        self.wireFrame?.backButtonAction()
    }
    
}

extension OBStepOnePresenter: OBStepOneInteractorOutputProtocol {
    func gpsPermissionResponse(success: Bool) {
        self.view?.handleGPSPermissionReponse(success: success)
    }
    
    func openSettings() {
        self.wireFrame?.openSettings()
    }
}
