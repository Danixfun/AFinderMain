//
//  OBStepOneInteractor.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import CoreLocation

class OBStepOneInteractor: NSObject, CLLocationManagerDelegate, OBStepOneInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: OBStepOneInteractorOutputProtocol?
    var localDatamanager: OBStepOneLocalDataManagerInputProtocol?
    var remoteDatamanager: OBStepOneRemoteDataManagerInputProtocol?
    var locationManager: CLLocationManager?
    /// iOS 13.0 or lower
    var currentStatus: CLAuthorizationStatus = .notDetermined
    
    // MARK: Functions
    func requestGPSPermission() {
        if currentStatus == .notDetermined {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
            locationManager?.requestWhenInUseAuthorization()
        }
        else if currentStatus == .denied {
            self.presenter?.openSettings()
        }
        
    }
    
    @available(iOS 11.0, *)
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.handleResponseWith(status: status)
    }
    
    @available(iOS 14.0, *)
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.handleResponseWith(status: manager.authorizationStatus)
    }
    
    private func handleResponseWith(status: CLAuthorizationStatus) {
        if status != .notDetermined{
            let response = (status == .authorizedAlways || status == .authorizedWhenInUse)
            self.currentStatus = status
            self.presenter?.gpsPermissionResponse(success: response)
        }
    }

}

extension OBStepOneInteractor: OBStepOneRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
