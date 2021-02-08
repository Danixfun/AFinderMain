//
//  OnboardingPresenter.swift
//  AFinder
//
//  Created by Daniel Tejeda on 06/02/21.
//  
//

import Foundation
import UIKit

class OnboardingPresenter  {
    
    // MARK: Properties
    weak var view: OnboardingViewProtocol?
    var interactor: OnboardingInteractorInputProtocol?
    var wireFrame: OnboardingWireFrameProtocol?
    
}

extension OnboardingPresenter: OnboardingPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        self.view?.setUpViews()
        self.interactor?.setUpNotifications()
    }
    
    func viewDidLayoutSubviews() {
        self.view?.fixLayoutSubviews()
    }
}

extension OnboardingPresenter: OnboardingInteractorOutputProtocol {

    // TODO: implement interactor output methods
    func updateStep(index: Int, direction: UIPageViewController.NavigationDirection) {
        self.view?.updateStep(index: index, direction: direction)
    }
    
    func dismiss() {
        self.wireFrame?.dismiss(view: self.view!)
    }
    
    func finish() {
        self.wireFrame?.finish(view: self.view!)
    }
}
