//
//  OBStepTwoInteractor.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit

class OBStepTwoInteractor: OBStepTwoInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: OBStepTwoInteractorOutputProtocol?
    var localDatamanager: OBStepTwoLocalDataManagerInputProtocol?
    var remoteDatamanager: OBStepTwoRemoteDataManagerInputProtocol?
    
    // MARK: Functions
    func rangeDidChange(sender: UISlider) {
        let value = Int(sender.value)
        self.presenter?.updateRangeView(km: value, circleRadius: CGFloat(value))
    }
    
    func saveRange(range: Int) {
        self.localDatamanager?.saveRange(range: range)
    }
    
}

extension OBStepTwoInteractor: OBStepTwoRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
