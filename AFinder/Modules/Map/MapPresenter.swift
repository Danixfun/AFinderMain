//
//  MapPresenter.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import CoreLocation

class MapPresenter  {
    
    // MARK: Properties
    weak var view: MapViewProtocol?
    var interactor: MapInteractorInputProtocol?
    var wireFrame: MapWireFrameProtocol?
    
}

extension MapPresenter: MapPresenterProtocol {
    
    // TODO: implement presenter methods
    func viewDidLoad() {
        self.view?.setUpMap()
        self.view?.setUpNoGPSContainer()
        self.view?.setUpNoWiFiContainer()
        self.view?.setUpHints()
        self.interactor?.setUpLocationManager()
        self.interactor?.setUpNotifications()
    }
    
    func findAirports(location: CLLocation){
        self.interactor?.findAirports(location: location)
    }
    
    func deniedMap() {
        self.view?.deniedMap()
    }
    
    func grantMap() {
        self.view?.grantMap()
    }
    
    func refreshAction(){
        self.interactor?.refreshAction()
    }
    
    func openDeviceSettingsAction() {
        self.wireFrame?.openDeviceSettingsAction()
    }
    
    func listButtonAction(airports: AirportResponse?) {
        self.wireFrame?.openList(from: self.view!, airports: airports)
    }
    
    func openAppSettings() {
        self.wireFrame?.openAppSettings(from: self.view!)
    }
    
}

extension MapPresenter: MapInteractorOutputProtocol {
    
    func foundAirports(airports: AirportResponse, hint: String) {
        self.view?.grantMap()
        self.view?.updateHintWithSearchResult(searchResultHint: hint)
        self.view?.foundAirports(airports: airports)
    }
    
    func emptyAirports(hint: String) {
        self.view?.grantMap()
        self.view?.updateHintWithSearchResult(searchResultHint: hint)
        self.view?.emptyAirports()
    }
    
    func errorLoadingAirports() {
        self.view?.errorLoadingAirports()
    }
    
    func locationDisabled() {
        self.deniedMap()
    }
    
    func centerMapWith(location: CLLocation, range: Int){
        self.view?.centerMapWith(location: location, range: range)
    }
    
    func showMap(){
        self.view?.grantMap()
    }
    
    func hideMap() {
        self.view?.deniedMap()
    }
    
    func updateHintWith(hint: String) {
        self.view?.updateHintWith(hint: hint)
    }

}
