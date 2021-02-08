//
//  OBStepThreeProtocols.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit

protocol OBStepThreeViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: OBStepThreePresenterProtocol? { get set }
    func setUpLabels()
    func setUpButtons()
    func setUpAnimation()
}

protocol OBStepThreeWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createOBStepThreeModule(step: OnboardingSteps) -> UIViewController
    func doneButtonAction()
    func backButtonAction()
}

protocol OBStepThreePresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: OBStepThreeViewProtocol? { get set }
    var interactor: OBStepThreeInteractorInputProtocol? { get set }
    var wireFrame: OBStepThreeWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func viewDidLayoutSubviews()
    func doneButtonAction()
    func backButtonAction()
}

protocol OBStepThreeInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
}

protocol OBStepThreeInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: OBStepThreeInteractorOutputProtocol? { get set }
    var localDatamanager: OBStepThreeLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: OBStepThreeRemoteDataManagerInputProtocol? { get set }
    
    func doneButtonAction()
}

protocol OBStepThreeRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: OBStepThreeRemoteDataManagerOutputProtocol? { get set }
}

protocol OBStepThreeRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol OBStepThreeLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: OBStepThreeLocalDataManagerOutputProtocol? { get set }
    func disableOnboarding()
}

protocol OBStepThreeLocalDataManagerOutputProtocol: class {
    // LOCALDATAMANAGER -> INTERACTOR
}
