//
//  OBStepThreePresenter.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation

class OBStepThreePresenter  {
    
    // MARK: Properties
    weak var view: OBStepThreeViewProtocol?
    var interactor: OBStepThreeInteractorInputProtocol?
    var wireFrame: OBStepThreeWireFrameProtocol?
    var once: Bool = false
    
}

extension OBStepThreePresenter: OBStepThreePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        self.view?.setUpButtons()
        self.view?.setUpLabels()
    }
    
    func viewDidLayoutSubviews() {
        if !once {
            once = true
            self.view?.setUpAnimation()
        }
    }
    
    func doneButtonAction() {
        self.interactor?.doneButtonAction()
        self.wireFrame?.doneButtonAction()
    }
    
    func backButtonAction() {
        self.wireFrame?.backButtonAction()
    }
}

extension OBStepThreePresenter: OBStepThreeInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
