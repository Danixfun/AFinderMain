//
//  OBStepTwoPresenter.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit

class OBStepTwoPresenter  {
    
    // MARK: Properties
    weak var view: OBStepTwoViewProtocol?
    var interactor: OBStepTwoInteractorInputProtocol?
    var wireFrame: OBStepTwoWireFrameProtocol?
    var once: Bool = false
}

extension OBStepTwoPresenter: OBStepTwoPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        self.view?.loadCurrentRange()
        self.view?.setUpLabels()
        self.view?.setUpButtons()
    }
    
    func viewDidLayoutSubviews() {
        if !once {
            once = true
            self.view?.setUpRangeCircleView()
        }
    }
    
    func rangeDidChange(sender: UISlider) {
        self.interactor?.rangeDidChange(sender: sender)
    }
    
    func nextStep(range: Int) {
        self.interactor?.saveRange(range: range)
        self.wireFrame?.nextStep()
    }
}

extension OBStepTwoPresenter: OBStepTwoInteractorOutputProtocol {
    func updateRangeView(km: Int, circleRadius: CGFloat) {
        self.view?.updateRangeView(km: km, circleRadius: circleRadius)
    }
}
