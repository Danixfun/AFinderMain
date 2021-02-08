//
//  SettingsPresenter.swift
//  AFinder
//
//  Created by Daniel Tejeda on 08/02/21.
//  
//

import Foundation

class SettingsPresenter  {
    
    // MARK: Properties
    weak var view: SettingsViewProtocol?
    var interactor: SettingsInteractorInputProtocol?
    var wireFrame: SettingsWireFrameProtocol?
    
}

extension SettingsPresenter: SettingsPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        self.view?.setUpLabels()
        self.view?.setUpButtons()
        self.view?.setUpExitAreaView()
        self.interactor?.loadCurrentRange()
    }
    
    func updateRange(range: Float) {
        self.interactor?.updateRange(range: range)
    }
    
    func updateMapAction(range: Float) {
        self.interactor?.saveNewRange(range: range)
        self.wireFrame?.dismiss(from: self.view!, range: range)
    }
    
    func dismissView() {
        self.wireFrame?.quit(from: self.view!)
    }
}

extension SettingsPresenter: SettingsInteractorOutputProtocol {
    func currentRange(range: Float, rangeText: String) {
        self.view?.loadCurrentRange(range: range, rangeText: rangeText)
    }
    
    func newRangeString(rangeText: String) {
        self.view?.updateRangeLabel(rangeText: rangeText)
    }
}
