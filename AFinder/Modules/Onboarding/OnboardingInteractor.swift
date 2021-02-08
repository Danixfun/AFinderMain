//
//  OnboardingInteractor.swift
//  AFinder
//
//  Created by Daniel Tejeda on 06/02/21.
//  
//

import Foundation
import UIKit

class OnboardingInteractor: OnboardingInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: OnboardingInteractorOutputProtocol?
    var localDatamanager: OnboardingLocalDataManagerInputProtocol?
    var remoteDatamanager: OnboardingRemoteDataManagerInputProtocol?
    
    // MARK: Functions
    func setUpNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.nextStep(n:)), name: NotiNames.nextOnboardingStep, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.finish(n:)), name: NotiNames.finishOnboarding, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.quit(n:)), name: NotiNames.quitOnboarding, object: nil)
    }
    
    @objc func nextStep(n: Notification){
        guard let userInfo = n.userInfo else { return }
        guard let newIndex:Int = (userInfo["goto"] as? OnboardingSteps)?.id else { return }
        guard let direction:UIPageViewController.NavigationDirection = userInfo["direction"] as? UIPageViewController.NavigationDirection else { return }
        
        self.presenter?.updateStep(index: newIndex, direction: direction)
        
    }
    
    @objc func quit(n: Notification){
        self.presenter?.dismiss()
    }
    
    @objc func finish(n: Notification){
        self.presenter?.finish()
    }

}

extension OnboardingInteractor: OnboardingRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
