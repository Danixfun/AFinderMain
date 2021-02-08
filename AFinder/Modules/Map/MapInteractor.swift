//
//  MapInteractor.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import CoreLocation

class MapInteractor:NSObject, MapInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: MapInteractorOutputProtocol?
    var localDatamanager: MapLocalDataManagerInputProtocol?
    var remoteDatamanager: MapRemoteDataManagerInputProtocol?
    var locationManager = CLLocationManager()
    
    func setUpLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.searchAirports()
    }
    
    func findAirports(location: CLLocation) {
        self.remoteDatamanager?.findAirports(location: location, radius: rangeFromUserDefaults())
    }
    
    func setUpNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateMapWithNewRange(n:)), name: NotiNames.updateMapWithNewRange, object: nil)
    }
    
    func refreshAction() {
        self.searchAirports()
    }
    
    private func searchAirports(){
        if isLocationServiceEnabled() {
            // Update map
            guard let location = locationManager.location else {
                return
            }
            self.presenter?.centerMapWith(location: location, range: rangeFromUserDefaults())
            self.findAirports(location: location)
        }
        else{
            // deniedMap
            self.presenter?.locationDisabled()
        }
    }
    
    //Cambiar a local data manager
    private func rangeFromUserDefaults()->Int{
        return self.localDatamanager?.getRange() ?? RadiusRangeValues.defaultValue
    }
    
    @objc func updateMapWithNewRange(n: Notification) {
        self.presenter?.updateHintWith(hint: "Searching...".localized())
        self.refreshAction()
    }
    
    private func makeSearchResultHint(foundNumber: Int)->String{
        let foundTranslation = "Found".localized()
        var airportsTranslation = "airports".localized()
        if foundNumber == 1{
            airportsTranslation = "airport".localized()
        }
        return "\(foundTranslation) \(foundNumber) \(airportsTranslation)"
    }
}

extension MapInteractor: MapRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func foundAirports(airports: AirportResponse?, error: AirportFetchError) {
        let searchHint = makeSearchResultHint(foundNumber: airports?.data.count ?? 0)
        if error == .None{
            guard let airports = airports else {
                self.presenter?.emptyAirports(hint: searchHint)
                return
            }
            self.presenter?.foundAirports(airports: airports, hint: searchHint)
        }
        else if error == .Empty{
            self.presenter?.emptyAirports(hint: searchHint)
        }
        else if error == .ServerError {
            self.presenter?.errorLoadingAirports()
        }
    }
}

extension MapInteractor: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined, .restricted, .denied:
            self.presenter?.hideMap()
        case .authorizedAlways, .authorizedWhenInUse:
            self.presenter?.showMap()
            self.searchAirports()
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.searchAirports()
    }
}

