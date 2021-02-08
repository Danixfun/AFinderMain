//
//  OnboardingPageView.swift
//  AFinder
//
//  Created by Daniel Tejeda on 06/02/21.
//

import UIKit

class OnboardingView: UIPageViewController {
    
    // MARK: Properties
    var presenter: OnboardingPresenterProtocol?
    lazy var firstStepViewController = {
        return stepsViewControllers.first as! UIViewController
    }()
    private var steps:[OnboardingSteps] = OnboardingSteps.allCases
    private var stepsViewControllers = [OnboardingStepProtocol]()
    
    // MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.presenter?.viewDidLayoutSubviews()
    }
    
}

extension OnboardingView: OnboardingViewProtocol {
    // TODO: implement view output methods
    func setUpViews(){
        if let stepOne = OBStepOneWireFrame.createOBStepOneModule(step: .StepOne) as? OnboardingStepProtocol {
            stepsViewControllers.append(stepOne)
        }
        
        if let stepTwo = OBStepTwoWireFrame.createOBStepTwoModule(step: .StepTwo) as? OnboardingStepProtocol {
            stepsViewControllers.append(stepTwo)
        }
        
        if let stepThree = OBStepThreeWireFrame.createOBStepThreeModule(step: .StepThree) as? OnboardingStepProtocol {
            stepsViewControllers.append(stepThree)
        }
        self.setViewControllers([firstStepViewController], direction: .forward, animated: true, completion: nil)
    }
    
    func updateStep(index: Int, direction: UIPageViewController.NavigationDirection) {
        let newVC = stepsViewControllers[index] as! UIViewController
        self.setViewControllers([newVC], direction: direction, animated: true, completion: nil)
    }
    
    /// corrects scrollview frame to allow for full-screen view controller pages
    func fixLayoutSubviews(){
        for subView in self.view.subviews {
            if subView is UIScrollView {
                subView.frame = self.view.bounds
            }
        }
        super.viewDidLayoutSubviews()
    }
    
    
}

