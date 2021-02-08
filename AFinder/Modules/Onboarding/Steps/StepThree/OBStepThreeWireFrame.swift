//
//  OBStepThreeWireFrame.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit

class OBStepThreeWireFrame: OBStepThreeWireFrameProtocol {
    
    // MARK: Init
    class func createOBStepThreeModule(step: OnboardingSteps) -> UIViewController {
        if let view = mainStoryboard.instantiateViewController(withIdentifier: step.storyboardId) as? OBStepThreeView {
            let presenter: OBStepThreePresenterProtocol & OBStepThreeInteractorOutputProtocol = OBStepThreePresenter()
            let interactor: OBStepThreeInteractorInputProtocol & OBStepThreeRemoteDataManagerOutputProtocol = OBStepThreeInteractor()
            let localDataManager: OBStepThreeLocalDataManagerInputProtocol = OBStepThreeLocalDataManager()
            let remoteDataManager: OBStepThreeRemoteDataManagerInputProtocol = OBStepThreeRemoteDataManager()
            let wireFrame: OBStepThreeWireFrameProtocol = OBStepThreeWireFrame()
            
            view.presenter = presenter
            view.index = step.id
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return view
        }
        
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "OnboardingView", bundle: Bundle.main)
    }
    
    // MARK: Functions
    func doneButtonAction() {
        NotificationCenter.default.post(name: NotiNames.finishOnboarding, object: nil, userInfo: nil)
    }
    
    func backButtonAction() {
        NotificationCenter.default.post(name: NotiNames.nextOnboardingStep, object: nil, userInfo: ["goto":OnboardingSteps.StepTwo, "direction":UIPageViewController.NavigationDirection.reverse])
    }
    
}
