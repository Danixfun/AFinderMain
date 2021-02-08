//
//  WelcomeWireFrame.swift
//  AFinder
//
//  Created by Daniel Tejeda on 05/02/21.
//  
//

import Foundation
import UIKit

class WelcomeWireFrame: WelcomeWireFrameProtocol {
    
    // MARK: Init
    class func createWelcomeModule() -> UIViewController {
        if let view = mainStoryboard.instantiateViewController(withIdentifier: "WelcomeView") as? WelcomeView {
        
            let presenter: WelcomePresenterProtocol & WelcomeInteractorOutputProtocol = WelcomePresenter()
            let interactor: WelcomeInteractorInputProtocol & WelcomeRemoteDataManagerOutputProtocol = WelcomeInteractor()
            let localDataManager: WelcomeLocalDataManagerInputProtocol = WelcomeLocalDataManager()
            let remoteDataManager: WelcomeRemoteDataManagerInputProtocol = WelcomeRemoteDataManager()
            let wireFrame: WelcomeWireFrameProtocol = WelcomeWireFrame()
            
            view.presenter = presenter
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
        return UIStoryboard(name: "WelcomeView", bundle: Bundle.main)
    }
    
    // MARK: Functions
    func openOnboardingAction(from view: WelcomeViewProtocol) {
        let destination = OnboardingWireFrame.createOnboardingModule()
        if let newView = view as? UIViewController{
            destination.modalPresentationStyle = .fullScreen
            newView.present(destination, animated: true, completion: nil)
        }
    }
    
    func openMapView(from view: WelcomeViewProtocol) {
        let destination = MapWireFrame.createMapModule()
        if let newView = view as? UIViewController{
            destination.modalPresentationStyle = .fullScreen
            newView.present(destination, animated: true, completion: nil)
        }
    }
    
}
