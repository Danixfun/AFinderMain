//
//  SettingsProtocols.swift
//  AFinder
//
//  Created by Daniel Tejeda on 08/02/21.
//  
//

import Foundation
import UIKit

protocol SettingsViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: SettingsPresenterProtocol? { get set }
    func setUpLabels()
    func setUpButtons()
    func setUpExitAreaView()
    func loadCurrentRange(range: Float, rangeText: String)
    func updateRangeLabel(rangeText: String)
}

protocol SettingsWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createSettingsModule() -> UIViewController
    func dismiss(from view: SettingsViewProtocol, range: Float)
    func quit(from view: SettingsViewProtocol)
}

protocol SettingsPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: SettingsViewProtocol? { get set }
    var interactor: SettingsInteractorInputProtocol? { get set }
    var wireFrame: SettingsWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func updateRange(range: Float)
    func updateMapAction(range: Float)
    func dismissView()
}

protocol SettingsInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func currentRange(range: Float, rangeText:String)
    func newRangeString(rangeText: String)
}

protocol SettingsInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: SettingsInteractorOutputProtocol? { get set }
    var localDatamanager: SettingsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: SettingsRemoteDataManagerInputProtocol? { get set }
    func loadCurrentRange()
    func updateRange(range: Float)
    func saveNewRange(range: Float)
}

protocol SettingsRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: SettingsRemoteDataManagerOutputProtocol? { get set }
    
}

protocol SettingsRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol SettingsLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    var localRequestHandler: SettingsLocalDataManagerOutputProtocol? { get set }
    func loadCurrentRange()
    func saveNewRange(range: Float)
}

protocol SettingsLocalDataManagerOutputProtocol: class {
    // LOCALDATAMANAGER -> INTERACTOR
    func currentRange(range: Int)
}
