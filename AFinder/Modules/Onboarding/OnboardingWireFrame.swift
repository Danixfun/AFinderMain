//
//  OnboardingWireFrame.swift
//  AFinder
//
//  Created by Daniel Tejeda on 06/02/21.
//  
//

import Foundation
import UIKit

class OnboardingWireFrame: OnboardingWireFrameProtocol {
    
    // MARK: Init
    class func createOnboardingModule() -> UIViewController {
        
        if let pageViewController = mainStoryboard.instantiateViewController(withIdentifier: "OnboardingPageView") as? OnboardingView {
            
            let presenter: OnboardingPresenterProtocol & OnboardingInteractorOutputProtocol = OnboardingPresenter()
            let interactor: OnboardingInteractorInputProtocol & OnboardingRemoteDataManagerOutputProtocol = OnboardingInteractor()
            let localDataManager: OnboardingLocalDataManagerInputProtocol = OnboardingLocalDataManager()
            let remoteDataManager: OnboardingRemoteDataManagerInputProtocol = OnboardingRemoteDataManager()
            let wireFrame: OnboardingWireFrameProtocol = OnboardingWireFrame()
            
            pageViewController.presenter = presenter
            presenter.view = pageViewController
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return pageViewController
            
        }
        
        
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "OnboardingView", bundle: Bundle.main)
    }
    
    // MARK: Functions
    func dismiss(view: OnboardingViewProtocol) {
        if let actualView = view as? OnboardingView {
            actualView.dismiss(animated: true, completion: nil)
        }
    }
    
    func finish(view: OnboardingViewProtocol) {
        if let actualView = view as? OnboardingView {
            actualView.dismiss(animated: true, completion: {
                NotificationCenter.default.post(name: NotiNames.openMapView, object: nil, userInfo: nil)
            })
        }
    }
}
