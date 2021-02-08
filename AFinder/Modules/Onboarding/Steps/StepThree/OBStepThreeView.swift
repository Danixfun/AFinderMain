//
//  OBStepThreeView.swift
//  AFinder
//
//  Created by Daniel Tejeda on 07/02/21.
//  
//

import Foundation
import UIKit

class OBStepThreeView: UIViewController, OnboardingStepProtocol {

    // MARK: Properties
    var presenter: OBStepThreePresenterProtocol?
    var index: Int = 0
    
    // MARK: IBOutlet
    @IBOutlet weak var animationContainer: UIView!
    @IBOutlet weak var doneButton: AFPrimaryButton!
    @IBOutlet weak var backButton: AFSecondaryButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    // MARK: IBAction
    @IBAction func doneButtonAction(_ sender: Any) {
        self.presenter?.doneButtonAction()
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        self.presenter?.backButtonAction()
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.presenter?.viewDidLayoutSubviews()
    }
}

extension OBStepThreeView: OBStepThreeViewProtocol {
    func setUpLabels() {
        self.titleLabel.text = "Find an airport".localized()
        self.subtitleLabel.text = "Select one".localized()
    }
    
    func setUpButtons() {
        self.doneButton.setQuick(title: "Done")
        self.backButton.setQuick(title: "Back")
    }
    
    func setUpAnimation() {
        AnimationWrapper.setUpAnimation(in: self.animationContainer, withFile: "airplane_landing")
    }

}
