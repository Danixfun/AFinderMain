//
//  OBStepTwoWireFrame.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit

class OBStepTwoWireFrame: OBStepTwoWireFrameProtocol {
    
    //MARK: Init
    class func createOBStepTwoModule(step: OnboardingSteps) -> UIViewController {
        if let view = mainStoryboard.instantiateViewController(withIdentifier: step.storyboardId) as? OBStepTwoView {
            let presenter: OBStepTwoPresenterProtocol & OBStepTwoInteractorOutputProtocol = OBStepTwoPresenter()
            let interactor: OBStepTwoInteractorInputProtocol & OBStepTwoRemoteDataManagerOutputProtocol = OBStepTwoInteractor()
            let localDataManager: OBStepTwoLocalDataManagerInputProtocol = OBStepTwoLocalDataManager()
            let remoteDataManager: OBStepTwoRemoteDataManagerInputProtocol = OBStepTwoRemoteDataManager()
            let wireFrame: OBStepTwoWireFrameProtocol = OBStepTwoWireFrame()
            
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
    func nextStep() {
        NotificationCenter.default.post(name: NotiNames.nextOnboardingStep, object: nil, userInfo: ["goto":OnboardingSteps.StepThree, "direction":UIPageViewController.NavigationDirection.forward])
    }
    
}
