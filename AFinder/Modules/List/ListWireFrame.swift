//
//  ListWireFrame.swift
//  AFinder
//
//  Created by Daniel Tejeda on 08/02/21.
//  
//

import Foundation
import UIKit

class ListWireFrame: ListWireFrameProtocol {

    // MARK: Init
    class func createListModule(airports: AirportResponse?) -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ListNavigationView")
        if let view = navController.children.first as? ListView {
            let presenter: ListPresenterProtocol & ListInteractorOutputProtocol = ListPresenter()
            let interactor: ListInteractorInputProtocol & ListRemoteDataManagerOutputProtocol = ListInteractor()
            let localDataManager: ListLocalDataManagerInputProtocol = ListLocalDataManager()
            let remoteDataManager: ListRemoteDataManagerInputProtocol = ListRemoteDataManager()
            let wireFrame: ListWireFrameProtocol = ListWireFrame()
            
            view.presenter = presenter
            view.airports = airports
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "ListView", bundle: Bundle.main)
    }
    
    // MARK: Functions
    func dismiss(from view: ListViewProtocol) {
        if let actualView = view as? UIViewController {
            actualView.dismiss(animated: true, completion: nil)
        }
    }
    
}
