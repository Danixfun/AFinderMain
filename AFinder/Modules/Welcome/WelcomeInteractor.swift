//
//  WelcomeInteractor.swift
//  AFinder
//
//  Created by Daniel Tejeda on 05/02/21.
//  
//

import Foundation

class WelcomeInteractor: WelcomeInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: WelcomeInteractorOutputProtocol?
    var localDatamanager: WelcomeLocalDataManagerInputProtocol?
    var remoteDatamanager: WelcomeRemoteDataManagerInputProtocol?
    
    func setUpNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.openMapView(n:)), name: NotiNames.openMapView, object: nil)
    }
    
    @objc private func openMapView(n: Notification){
        self.presenter?.openMapView()
    }

}

extension WelcomeInteractor: WelcomeRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
