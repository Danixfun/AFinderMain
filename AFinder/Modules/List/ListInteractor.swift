//
//  ListInteractor.swift
//  AFinder
//
//  Created by Daniel Tejeda on 08/02/21.
//  
//

import Foundation

class ListInteractor: ListInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: ListInteractorOutputProtocol?
    var localDatamanager: ListLocalDataManagerInputProtocol?
    var remoteDatamanager: ListRemoteDataManagerInputProtocol?
    
    func handleNumberOfAirports(airports: AirportResponse?) {
        let isEmpty = (airports?.data.count == 0 || airports == nil)
        self.presenter?.handleNumberOfAirports(isEmpty: isEmpty)
    }

}

extension ListInteractor: ListRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
