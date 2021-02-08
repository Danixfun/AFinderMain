//
//  OnboardingSteps.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//

import Foundation

enum OnboardingSteps: CaseIterable {
    case StepOne
    case StepTwo
    case StepThree
    
    var storyboardId: String{
        switch self {
        case .StepOne:
            return "OnboardingStepOne"
        case .StepTwo:
            return "OnboardingStepTwo"
        case .StepThree:
            return "OnboardingStepThree"
        }
    }
    
    var id: Int{
        switch self {
        case .StepOne:
            return 0
        case .StepTwo:
            return 1
        case .StepThree:
            return 2
        }
    }
}
