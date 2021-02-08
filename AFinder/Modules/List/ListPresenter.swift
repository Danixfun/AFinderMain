//
//  ListPresenter.swift
//  AFinder
//
//  Created by Daniel Tejeda on 08/02/21.
//  
//

import Foundation

class ListPresenter  {
    
    // MARK: Properties
    weak var view: ListViewProtocol?
    var interactor: ListInteractorInputProtocol?
    var wireFrame: ListWireFrameProtocol?
    
}

extension ListPresenter: ListPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad(airports: AirportResponse?) {
        self.view?.setUpButtons()
        self.view?.setUpNavigationBarTitle()
        self.interactor?.handleNumberOfAirports(airports: airports)
    }

    func backButtonAction() {
        self.wireFrame?.dismiss(from: self.view!)
    }
}

extension ListPresenter: ListInteractorOutputProtocol {
    func handleNumberOfAirports(isEmpty: Bool) {
        if isEmpty {
            self.view?.setUpEmptyTableView()
        }
        else {
            self.view?.setUpTableView()
        }
    }
}
