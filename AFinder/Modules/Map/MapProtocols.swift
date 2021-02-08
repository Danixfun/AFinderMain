//
//  MapProtocols.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit
import CoreLocation

protocol MapViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: MapPresenterProtocol? { get set }
    func centerMapWith(location: CLLocation, range: Int)
    func foundAirports(airports:AirportResponse)
    func emptyAirports()
    func errorLoadingAirports()
    func deniedMap()
    func grantMap()
    func setUpNoGPSContainer()
    func setUpNoWiFiContainer()
    func setUpHints()
    func setUpMap()
    func updateHintWithSearchResult(searchResultHint: String)
    func updateHintWith(hint: String)
}

protocol MapWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createMapModule() -> UIViewController
    func openDeviceSettingsAction()
    func openAppSettings(from view: MapViewProtocol)
    func openList(from view: MapViewProtocol, airports: AirportResponse?)
}

protocol MapPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: MapViewProtocol? { get set }
    var interactor: MapInteractorInputProtocol? { get set }
    var wireFrame: MapWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func findAirports(location: CLLocation)
    func deniedMap()
    func grantMap()
    func refreshAction()
    func openDeviceSettingsAction()
    func openAppSettings()
    func listButtonAction(airports: AirportResponse?)
}

protocol MapInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func foundAirports(airports:AirportResponse, hint: String)
    func emptyAirports(hint: String)
    func errorLoadingAirports()
    func locationDisabled()
    func centerMapWith(location: CLLocation, range: Int)
    func showMap()
    func hideMap()
    func updateHintWith(hint: String)
}

protocol MapInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: MapInteractorOutputProtocol? { get set }
    var localDatamanager: MapLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: MapRemoteDataManagerInputProtocol? { get set }
    
    func findAirports(location: CLLocation)
    func setUpNotifications()
    func setUpLocationManager()
    func refreshAction()
}

protocol MapRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: MapRemoteDataManagerOutputProtocol? { get set }
    
    func findAirports(location: CLLocation, radius: Int)
}

protocol MapRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func foundAirports(airports:AirportResponse?, error: AirportFetchError)
}

protocol MapLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: MapLocalDataManagerOutputProtocol? { get set }
    
    func getRange()->Int
}

protocol MapLocalDataManagerOutputProtocol: class {
    // LOCALDATAMANAGER -> INTERACTOR
}
